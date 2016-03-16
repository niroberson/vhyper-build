import sys
from PyQt5 import QtCore, QtGui, QtWidgets
import inputgui
import tcpserver


class InputTestGui(inputgui.Ui_MainWindow):
    def __init__(self, MainWindow):
        super(InputTestGui, self).__init__()
        self.setupUi(MainWindow)
        self.plainTextEditFilter = TextEditReturnFilter(self.tcpSend, self.updateBrowser)
        self.plainTextEdit.installEventFilter(self.plainTextEditFilter)
        self.plainTextEdit.setFocus()

        self.server = None
        self.pushButton_2.clicked.connect(self.toggleServer)

    def toggleServer(self):
        _translate = QtCore.QCoreApplication.translate
        if not self.server:
            try:
                port = int(self.lineEdit_2.text())
            except ValueError:
                return
            self.server = tcpserver.TcpServer(self.connectionOpened, self.handleMessage, self.connectionClosed, port)
            self.pushButton_2.setText(_translate("MainWindow", "Close"))
        else:
            self.server.close()
            self.server = None
            self.textBrowser.append('Closed open connection')
            self.pushButton_2.setText(_translate("MainWindow", "Start Server"))

    def connectionOpened(self, addr):
        self.textBrowser.append('Connected to {}'.format(addr))

    def handleMessage(self, message):
        self.textBrowser.append('Received "{}" asynchronously'.format(message))

    def connectionClosed(self):
        self.textBrowser.append('Connection has been closed somehow')
        self.server = None
        self.pushButton_2.setText(QtCore.QCoreApplication.translate("MainWindow", "Start Server"))

    def tcpSend(self):
        if self.server:
            print('sending "{}"'.format(self.plainTextEdit.toPlainText()))
            received = self.server.send(self.plainTextEdit.toPlainText())
            self.textBrowser.append('{} {}'.format('Received', repr(received)))

    def updateBrowser(self):
        text = self.plainTextEdit.toPlainText()
        if text:
            self.textBrowser.append(self.plainTextEdit.toPlainText())
            self.plainTextEdit.setPlainText('')


class TextEditReturnFilter(QtCore.QObject):
    textEditReturn = QtCore.pyqtSignal()

    def __init__(self, *funcs):
        super(TextEditReturnFilter, self).__init__()
        for func in funcs:
            self.textEditReturn.connect(func)

    def eventFilter(self, srcObject, event):
        if event.type() == QtCore.QEvent.KeyPress and event.key() == QtCore.Qt.Key_Return:
            self.textEditReturn.emit()
            return True
        return super(TextEditReturnFilter, self).eventFilter(srcObject, event)


class MyQPlainTextEdit(QtWidgets.QPlainTextEdit):
    def keyPressEvent(self, event):
        if event.key() == QtCore.Qt.Key_Return:
            print('"{}" was entered'.format(self.toPlainText()))
            self.setPlainText('')
        else:
            super(MyQPlainTextEdit, self).keyPressEvent(event)

if __name__ == '__main__':
    app = QtWidgets.QApplication(sys.argv)
    testgui = QtWidgets.QMainWindow()
    ui = InputTestGui(testgui)
    testgui.show()
    sys.exit(app.exec_())

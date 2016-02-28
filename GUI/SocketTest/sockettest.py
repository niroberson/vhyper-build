import sys
from PyQt5 import QtCore, QtGui, QtWidgets
import socketgui
import tcpserver


class SocketTestGui(socketgui.Ui_MainWindow):
    def __init__(self, MainWindow):
        super(SocketTestGui, self).__init__()
        self.setupUi(MainWindow)
        self.plainTextEditFilter = TextEditReturnFilter(self)
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
            self.server = tcpserver.TcpServer(port)
            addr = self.server.accept()  # blocking
            self.textBrowser.append('Connected to {}'.format(addr))
            self.pushButton_2.setText(_translate("MainWindow", "Close"))
        else:
            self.server.close()
            self.server = None
            self.textBrowser.append('Closed open connection')
            self.pushButton_2.setText(_translate("MainWindow", "Host"))

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

    def __init__(self, gui):
        super(TextEditReturnFilter, self).__init__()
        self.textEditReturn.connect(gui.tcpSend)
        self.textEditReturn.connect(gui.updateBrowser)

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
    ui = SocketTestGui(testgui)
    testgui.show()
    sys.exit(app.exec_())

import socket
import sys
from PyQt5 import QtCore


class TcpServer(QtCore.QThread):
    HOST = None               # Symbolic name meaning all available interfaces
    opened = QtCore.pyqtSignal(str)
    received = QtCore.pyqtSignal(str)

    def __init__(self, connectionOpened, handleMessage, connectionClosed, port=50008):
        super(TcpServer, self).__init__()

        self.opened.connect(connectionOpened)
        self.received.connect(handleMessage)
        self.finished.connect(connectionClosed)

        self.port = port

        self.s = None  # the listening socket

        self.conn = None  # the socket connected to client
        self.addr = None

        self.start()  # calls run in a separate thread

    def run(self):
        if not self.setup():
            print('quit')
            self.quit()
        self.accept()

        while True:
            data = self.conn.recv(1024)
            if not data:
                break
            message = data.decode()
            self.received.emit(message)
            print('Received and sending back: "{}"'.format(data.decode()))
            self.conn.sendall(data)
        self.close()

    def setup(self):
        for res in socket.getaddrinfo(self.HOST, self.port, socket.AF_UNSPEC,
                                      socket.SOCK_STREAM, 0, socket.AI_PASSIVE):
            af, socktype, proto, canonname, sa = res
            try:
                self.s = socket.socket(af, socktype, proto)
            except OSError as msg:
                self.s = None
                continue
            try:
                self.s.bind(sa)
                self.s.listen(1)
            except OSError as msg:
                self.s.close()
                self.s = None
                continue
            break
        if self.s is None:
            print('could not open socket')
            return False
        print('Created server socket af="{}" socktype="{}" proto="{}" canonname="{}" sa="{}"'.format(
                                                                                af, socktype, proto, canonname, sa))
        return True

    def accept(self):
        self.conn, self.addr = self.s.accept()
        self.opened.emit(str(self.addr))
        print('Connected by', self.addr)
        return self.addr

    def send(self, message):
        if not message:
            return
        self.conn.sendall(message.encode())
        data = self.conn.recv(1024)
        print('Received', repr(data))
        return data

    def close(self):
        self.conn.close()
        self.quit()


def main():
    server = TcpServer()
    server.accept()
    while True:
        message = input()
        if not message:
            break
        server.send(message)
    server.close()

if __name__ == '__main__':
    main()

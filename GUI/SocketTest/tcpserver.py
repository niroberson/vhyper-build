# Echo server program
import socket
import sys


class TcpServer:
    HOST = None               # Symbolic name meaning all available interfaces

    def __init__(self, port=50008):
        self.s = None
        for res in socket.getaddrinfo(self.HOST, port, socket.AF_UNSPEC,
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
            return
        print('Created server socket af="{}" socktype="{}" proto="{}" canonname="{}" sa="{}"'.format(
                                                                                af, socktype, proto, canonname, sa))
        self.conn = None
        self.addr = None

    def accept(self):
        self.conn, self.addr = self.s.accept()
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

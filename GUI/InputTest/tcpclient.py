# Echo client program
import socket
import sys


def main():
    host = 'localhost'
    port = 50008
    s = None
    for res in socket.getaddrinfo(host, port, socket.AF_UNSPEC, socket.SOCK_STREAM):
        af, socktype, proto, canonname, sa = res
        print('Trying to connect to af="{}" socktype="{}" proto="{}" canonname="{}" sa="{}"'.format(
                                                                                af, socktype, proto, canonname, sa))
        try:
            s = socket.socket(af, socktype, proto)
        except OSError as msg:
            s = None
            continue
        try:
            s.connect(sa)
        except OSError as msg:
            s.close()
            s = None
            continue
        break
    if s is None:
        print('could not open socket')
        sys.exit(1)
    print('Connected to {}'.format(s.getpeername()))
    # while True:
    #     data = s.recv(1024)
    #     if not data:
    #         break
    #     print('Received and sending back: "{}"'.format(data.decode()))
    #     s.send(data)
    while True:
        message = input()
        if not message:
            break
        s.sendall(message.encode())
        print('Sent: "{}"'.format(message))
        data = s.recv(1024)
        print('Received', repr(data))
    s.close()

if __name__ == '__main__':
    main()

import socket # https://docs.python.org/3/library/socket.html
data = socket.gethostbyname_ex('intranet.elia.be')
data = socket.gethostbyname_ex('isoapp1010.belgrid.net')
print ("\n\nThe IP Address of the Domain Name is: "+repr(data))  
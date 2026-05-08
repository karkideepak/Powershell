Test-NetConnection -ComputerName google.com -port 443
# TcpTestSucceeded : True
Test-NetConnection -ComputerName google.com -port 22
# TcpTestSucceeded : False

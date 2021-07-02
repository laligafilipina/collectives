# monitor local traffic if mitm attacks occuring

# show DNS traffic
$ tcpdump -i wlan0 -nn -l udp port 53

# show HTTP User Agent and Hosts
$ tcpdump -i wlan0 -nn -l -A -s1500 | egrep -i 'User-Agent:|Host:'

# show HTTP requests and Hosts
$ tcpdump -i wlan0 -nn -l -s 0 -v | egrep -i "POST /|GET /|Host:"

# show e-mail recipients
$ tcpdump -i wlan0 -nn -l port 25 | egrep -i 'MAIL FROM\|RCPT TO'

# show FTP data
$ tcpdump -i wlan0 -nn -v port ftp or ftp-data

# show all passwords different protocols
$ tcpdump -i wlan0 port http or port ftp or port smtp or port imap or port pop3 or port telnet -l -A | egrep -i -B5 'pass=|pwd=|log=|login=|user=|username=|pw=|passw=|passwd=|password=|pass:|user:|username:|password:|login:|pass |user '

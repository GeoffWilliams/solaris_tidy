#!/bin/bash
# If this file exists it will be run on the system under test before puppet runs
# to setup any prequisite test conditions, etc
mkdir /etc/inet
cat << EOF > /etc/inet/inetd.conf
# To re-read this file after changes, just do a 'killall -HUP inetd'
#
#echo	stream	tcp	nowait	root	internal
#echo	dgram	udp	wait	root	internal
#discard	stream	tcp	nowait	root	internal
#discard	dgram	udp	wait	root	internal
#daytime	stream	tcp	nowait	root	internal
#daytime	dgram	udp	wait	root	internal
#chargen	stream	tcp	nowait	root	internal
#chargen	dgram	udp	wait	root	internal
#time	stream	tcp	nowait	root	internal
#time	dgram	udp	wait	root	internal
#
# These are standard services.
#
#ftp	stream	tcp	nowait	root	/usr/sbin/tcpd	in.ftpd -l -a
#telnet 	stream	tcp	nowait	root	/usr/sbin/tcpd	in.telnetd
#
# Shell, login, exec, comsat and talk are BSD protocols.
#
shell	stream	tcp	nowait	root	/usr/sbin/tcpd	in.rshd
login	stream	tcp	nowait	root	/usr/sbin/tcpd	in.rlogind
exec	stream	tcp	nowait	root	/usr/sbin/tcpd	in.rexecd
rexd stream	tcp	nowait	root	/usr/sbin/tcpd	in.rexd
walld stream	tcp	nowait	root	/usr/sbin/tcpd	in.wald
#comsat	dgram	udp	wait	root	/usr/sbin/tcpd	in.comsat
#talk	dgram	udp	wait	root	/usr/sbin/tcpd	in.talkd
#ntalk	dgram	udp	wait	root	/usr/sbin/tcpd	in.ntalkd
#dtalk 	stream	tcp	wait	nobody	/usr/sbin/tcpd	in.dtalkd
#
# Pop and imap mail services et al
#
#pop-2	stream	tcp	nowait	root	/usr/sbin/tcpd	ipop2d
#pop-3	stream	tcp	nowait	root	/usr/sbin/tcpd	ipop3d
#imap	stream	tcp	nowait	root	/usr/sbin/tcpd	imapd
#
# The Internet UUCP service.
#
#uucp	stream	tcp	nowait	uucp	/usr/sbin/tcpd  /usr/lib/uucp/uucico    -l
#
# Tftp service is provided primarily for booting.  Most sites
# run this only on machines acting as "boot servers." Do not uncomment
# this unless you *need* it.
#
#tftp	dgram	udp	wait	root	/usr/sbin/tcpd	in.tftpd
#bootps	dgram	udp	wait	root	/usr/sbin/tcpd	bootpd
#
# Finger, systat and netstat give out user information which may be
# valuable to potential "system crackers."  Many sites choose to disable
# some or all of these services to improve security.
#
#finger	stream	tcp	nowait	root	/usr/sbin/tcpd	in.fingerd
#cfinger	stream	tcp	nowait	root	/usr/sbin/tcpd	in.cfingerd
#systat	stream	tcp	nowait	guest	/usr/sbin/tcpd	/bin/ps -auwwx
#netstat	stream	tcp	nowait	guest	/usr/sbin/tcpd	/bin/netstat    -f inet
jboss stream	tcp	nowait	root	/usr/sbin/java -jar jbos123.jar	in.jboss
#
# Authentication
#
#auth	stream	tcp	nowait	nobody	/usr/sbin/in.identd    in.identd -l -e -o
#
# End of inetd.conf
EOF

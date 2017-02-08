# Solaris_tidy:::Strong_tcp_sequence
#
# Enforce correct TCP sequence generation
class solaris_tidy::strong_tcp_sequence {
# # cd /etc/default
# # awk '/TCP_STRONG_ISS=/ { $1 =
# "TCP_STRONG_ISS=2" }; \ { print }'
# inetinit > inetinit.new
# # mv inetinit.new inetinit
# # pkgchk -f -n -p
# /etc/default/inetinit
# # ndd -set /dev/tcp tcp_strong_iss 2
}

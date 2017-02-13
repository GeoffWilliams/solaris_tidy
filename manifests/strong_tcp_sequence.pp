# Solaris_tidy:::Strong_tcp_sequence
#
# Enforce correct TCP sequence generation
#
# @param tcp_strong_iss Value for TCP_STRONG_ISS in /etc/default/inetinit
class solaris_tidy::strong_tcp_sequence(
    String $tcp_strong_iss = "2",
) {

  file_line { "/etc/default/inetinit":
    ensure => present,
    path   => "/etc/default/inetinit",
    line   => "TCP_STRONG_ISS=${tcp_strong_iss}",
    match  => "^TCP_STRONG_ISS=",
  }
}

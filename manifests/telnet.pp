# Solaris_tidy::Telnet
#
# Banner settings for telnet
class solaris_tidy::telnet {

  file_line { "/etc/default/telnetd (remove banner)":
    ensure => present,
    path   => "/etc/default/telnetd",
    line   => "BANNER=",
    match  => "^BANNER=",
  }

  # stop telnet service
  service { "svc:/network/telnet:default":
    ensure => stopped,
    enable => false,
  }

}

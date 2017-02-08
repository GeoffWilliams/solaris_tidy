# Solaris_tidy::Inetd
#
# Disable some inetd services that may still be hanging around
class solaris_tidy::inetd {

  $inetd = "/etc/inet/inetd.conf"

  File_line {
    ensure            => absent,
    path              => $inetd,
    match_for_absence => true,
  }

  file_line { "${inetd} disable shell":
    match => '^shell',
  }

  file_line { "${inetd} disable login":
    match => '^login',
  }

  file_line { "${inetd} disable exec":
    match => '^exec',
  }

  file_line { "${inetd} disable rexd":
    match => '^rexd',
  }

  file_line { "${inetd} disable walld":
    match => '^walld',
  }
}

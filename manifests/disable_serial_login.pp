# Solaris_tidy::Disable_serial_login
#
# Disable login on serial ports
class solaris_tidy::disable_serial_login {
  ["ttya", "ttyb"].each |$port| {
    exec { "pmadm ${port}":
      command => "pmadm -d -p zsmon -s ${port}",
      unless  => "pmadm -l -p zsmon | grep ${port}.*x",
      path    => ['/usr/sbin', '/sbin', '/usr/bin', '/bin'],
    }
  }
}

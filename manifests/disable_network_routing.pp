# Solaris_tidy::Disable_network_routing
#
# Configure solaris to not to forward or route ipv4 traffic
class solaris_tidy::disable_network_routing {
  ["ipv4-forwarding", "ipv4-routing"].each |$key| {
    exec { "routeadm -d ${key}":
      command => "routeadm -d ${key}",
      unless  => "routeadm -p ${key} | grep persistent=disabled",
      path    => ['/usr/sbin', '/sbin', '/usr/bin', '/bin'],
      notify  => Exec["routeadm_updated"],
    }
  }

  exec { "routeadm_updated":
    refreshonly => true,
    command     => "routeadm -u",
    path        => ['/usr/sbin', '/sbin', '/usr/bin', '/bin'],
  }
}

# Solaris_tidy::Disable_network_routing
#
# Configure solaris to not to forward or route ipv4 traffic
class solaris_tidy::disable_network_routing {
# # routeadm -d ipv4-forwarding -d
# ipv6-forwarding
# # routeadm -d ipv4-routing -d ipv6-
# routing
# # routeadm -u
}

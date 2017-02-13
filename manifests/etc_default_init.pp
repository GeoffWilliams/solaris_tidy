# Solaris_tidy::Etc_default_init
#
# Manage settings in /etc/default/init
# * CMASK (umask)
#
# @param umask Default CMASK (umask) setting
class solaris_tidy::etc_default_init(
    String $umask = "022",
) {

  # set daemon umask
  shellvar { "/etc/default/init CMASK":
    ensure   => present,
    variable => "CMASK",
    target   => "/etc/default/init",
    value    => $umask,
  }
}

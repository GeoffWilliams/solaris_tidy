# Solaris_tidy::Protect_core_dumps
#
# Configure solaris to dump cores on a separate partition with restricted
# permissions
class solaris_tidy::protect_core_dumps {
  file { "/var/cores":
    ensure => directory,
    owner  => "root",
    group  => "root",
    mode   => "0700"
  }

  # running coreadm with no arguments gives a table that looks like this on a
  # stock solaris VM
  #
  # bash-3.2# coreadm
  #     global core file pattern:
  #     global core file content: default
  #       init core file pattern: core
  #       init core file content: default
  #            global core dumps: disabled
  #       per-process core dumps: enabled
  #      global setid core dumps: disabled
  # per-process setid core dumps: disabled
  #     global core dump logging: disabled
  #
  # After running command it looks more like this (!!! == changed field):
  #  bash-3.2# coreadm
  #     global core file pattern: /var/cores/core_%n_%f_%u_%g_%t_%p !!!
  #     global core file content: default
  #       init core file pattern: core
  #       init core file content: default
  #            global core dumps: enabled !!!
  #       per-process core dumps: enabled
  #      global setid core dumps: disabled
  # per-process setid core dumps: disabled
  #     global core dump logging: enabled !!!
  #
  # So we need to run if any of the above conditions incorrect
  exec { "configure global core dump":
    command => "coreadm -g /var/cores/core_%n_%f_%u_%g_%t_%p -e log -e global",

  }
#  coreadm |nawk -F ': ' '/global core file pattern/ { print $2 }'
}

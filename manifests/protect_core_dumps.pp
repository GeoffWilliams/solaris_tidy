# Solaris_tidy::Protect_core_dumps
#
# Configure solaris to dump cores on a separate partition with restricted
# permissions
#
# @param pattern Filename pattern for core dumps
class solaris_tidy::protect_core_dumps(
    $pattern = "/var/cores/core_%n_%f_%u_%g_%t_%p",
) {

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
  $coreadm = "coreadm | "
  $grep_pattern = "${coreadm} grep 'global core file pattern: ${pattern}''"
  $grep_dump    = "${coreadm} grep 'global core dumps: enabled'"
  $grep_log     = "${coreadm} grep ' global core dump logging: enabled'"

  exec { "coreadm file pattern":
    command => "coreadm -g ${pattern}",
    unless  => $grep_pattern,
    path    => ['/usr/bin', '/bin'],
  }

  exec { "coreadm global dump":
    command => "coreadm -e global",
    unless  => $grep_dump,
    path    => ['/usr/bin', '/bin'],
  }

  exec { "coreadm global log":
    command => "coreadm -e log",
    unless  => $grep_log,
    path    => ['/usr/bin', '/bin'],
  }
}

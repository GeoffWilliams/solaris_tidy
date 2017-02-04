# Solaris_tidy::gnome
#
# Set inactivity timeouts for gnome (XScreenSaver)
class solaris_tidy::gnome(
    $timeout      = "0:10:00",
    $lock_timeout = "0:00:00",
    $lock         = "True",
) {

  # Solaris 11 uses different path but we only support solaris 10
  # $xscreensaver_sol11 = "/usr/share/X11/app-defaults/XScreenSaver"
  $xscreensaver = "/usr/openwin/lib/app-defaults/XScreenSaver"


  file { $xscreensaver:
    ensure => file,
    owner  => "root",
    group  => "bin",
    mode   => "0444",
  }

  File_line {
    ensure => present,
    path   => $xscreensaver,
  }

  file_line { "${xscreensaver} (timeout)":
    match => '\*timeout:',
    line  => "\\*timeout: ${timeout}",
  }

  file_line { "${xscreensaver} (lock_timeout)":
    match => '\*lockTimeout:',
    line  => "\\*lockTimeout: ${lock_timeout}",
  }

  file_line { "${xscreensaver} (lock)":
    match => '\*lock:',
    line  => "\\*lock: ${lock}",
  }
}

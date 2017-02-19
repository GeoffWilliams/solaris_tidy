# Solaris_tidy::gnome
#
# Set inactivity timeouts for gnome (XScreenSaver)
class solaris_tidy::gnome(
    $timeout        = "0:10:00",
    $lock_timeout   = "0:00:00",
    $lock           = "True",
    $banner_message = false,
) {

  # Solaris 11 uses different path but we only support solaris 10
  # $xscreensaver_sol11 = "/usr/share/X11/app-defaults/XScreenSaver"
  $xscreensaver = "/usr/openwin/lib/app-defaults/XScreenSaver"

  if $facts['openwin_installed'] {
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

    ini_setting { "/etc/X11/gdm/gdm.conf Greeter":
      ensure  => present,
      path    => '/etc/X11/gdm/gdm.conf',
      section => 'daemon',
      setting => 'Greeter',
      value   => '/usr/bin/gdmlogin',
    }

    if $banner_message {
      ini_setting { "/etc/X11/gdm/gdm.conf Welcome":
        ensure  => present,
        path    => '/etc/X11/gdm/gdm.conf',
        section => 'greeter',
        setting => 'Welcome',
        value   => $banner_message,
      }

    }
  }
}

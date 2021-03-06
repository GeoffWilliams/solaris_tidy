# Solaris_tidy::gnome
#
# Set inactivity timeouts for gnome (XScreenSaver) and remove sensitive
# information from banner messages
#
# @param timeout How long to wait before activating the screensaver
# @param lock_timeout How long to wait after the screensaver activates before
#   locking the screen
# @param lock Quoted boolean in a string representing whether the screen should
#   be locked or not
# @param banner_message Message to display to users when logging in or unlocking
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
      ensure   => present,
      path     => $xscreensaver,
      encoding => 'iso-8859-1',
    }

    file_line { "${xscreensaver} (timeout)":
      match => '^*timeout:',
      line  => "*timeout: ${timeout}",
    }

    file_line { "${xscreensaver} (lock_timeout)":
      match => '^*lockTimeout:',
      line  => "*lockTimeout: ${lock_timeout}",
    }

    file_line { "${xscreensaver} (lock)":
      match => '^*lock:',
      line  => "*lock: ${lock}",
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

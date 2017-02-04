# Solaris_tidy::Cde
#
# Set inactivity timeouts for CDE by writing files to /etc/dt/config for each
# locale in the /usr/dt/config directory
class solaris_tidy::cde(
  $saver_timeout = 10,
  $lock_timeout = 10,
) {

  # heredoc seems to break exec for some reason...
  $file_content="dtsession*saverTimeout: ${saver_timeout}\ndtsession*lockTimeout: ${lock_timeout}"

  # directory under /etc/dt/config for each locale directory under /usr/dt/config
  # that contains a sys.resources file.
  # note: bash -c is needed on solaris, provider => shell doesn't seem to work
  # correctly, possibly because its attempting to use /bin/sh (ksh)...
  # MUST sort the lists or they arrive in different orders and trigger extra
  # corrective changes
  exec { "dt_config_dirs":
    onlyif  => 'bash -c \'[[ $(cd /etc/dt/config && find . -name sys.resources | sort) != $(cd /usr/dt/config && find . \
-name sys.resources | sort) ]]\'',
    command => 'bash -c \'cd /etc/dt/config && mkdir -p $(cd /usr/dt/config && find . -name sys.resources -exec dirname {} \; )\'',
    path    => [ '/bin', '/usr/bin'],
  }

  # for each shipped locale, replace contents of corresponding file under /etc/dt/config
  # with our canned $file_content *if* any of the corresponding files are different
  exec { "dt_config_files":
    unless  => "bash -c 'cd /usr/dt/config/ && for file in */sys.resources ; do if [[ \"$(cat /etc/dt/config/\$file)\" \
!= \"${file_content}\" ]]; then exit 1; fi; done'",
    command => "bash -c 'for file in $(cd /usr/dt/config && find . -name sys.resources) ; do echo \"${file_content}\" > \
\"/etc/dt/config/\$file\"; done'",
    path    => [ '/bin', '/usr/bin'],
  }

  chmod_r { "/etc/dt/config":
    want_mode => "0444",
  }

  chown_r { "/etc/dt/config":
    want_user  => "root",
    want_group => "sys",
  }
}

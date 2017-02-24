# Solaris_tidy::Etc_default_passwd
#
# Manage settings in /etc/default/passwd (password strength and ageing policy)
#
# @param maxweeks Maximum weeks of password validity
# @param minweeks Minimum weeks of password validity
# @param warnweeks Weeks validity remaining before warnings are displayed
# @param passlength Minimum password length
# @param namecheck Check for names
# @param history Historic passwords to keep
# @param mindiff Minium different characters
# @param minalpha Minimum alphanumeric characters
# @param minupper Minimum upper case characters
# @param minlower Minimum lower case characters
# @param minnonalpha Minimum non-alphanumeric characters
# @param maxrepeats Maximum allowed reapeated characters
# @param whitespace Allow whitespace in passwords
# @param dictiondbdir Dictionary DB Dir
# @param dictionlist Wordlist compare passwords to
class solaris_tidy::etc_default_passwd(
    $maxweeks     = "13",
    $minweeks     = "1",
    $warnweeks    = "4",
    $passlength   = "8",
    $namecheck    = "YES",
    $history      = "10",
    $mindiff      = "3",
    $minalpha     = "2",
    $minupper     = "1",
    $minlower     = "1",
    $minnonalpha  = "1",
    $maxrepeats   = "0",
    $whitespace   = "YES",
    $dictiondbdir = "/var/passwd",
    $dictionlist  = "/usr/share/lib/dict/words",
) {

  Shellvar {
    #ensure => present,
    target => "/etc/default/passwd",
  }

  shellvar { "/etc/default/passwd MAXWEEKS":
    variable => "MAXWEEKS",
    value    => $maxweeks,
  }

  shellvar { "/etc/default/passwd MINWEEKS":
    variable => "MINWEEKS",
    value    => $minweeks,
  }

  shellvar { "/etc/default/passwd WARNWEEKS":
    variable => "WARNWEEKS",
    value    => $warnweeks,
  }

  shellvar { "/etc/default/passwd PASSLENGTH":
    variable => "PASSLENGTH",
    value    => $passlength,
  }

  shellvar { "/etc/default/passwd variableCHECK":
    variable => "NAMECHECK",
    value    => $namecheck,
  }

  shellvar { "/etc/default/passwd HISTORY":
    variable => "HISTORY",
    value    => $history,
  }

  shellvar { "/etc/default/passwd MINDIFF":
    variable => "MINDIFF",
    value    => $mindiff,
  }

  shellvar { "/etc/default/passwd MINALPHA":
    variable => "MINALPHA",
    value    => $minalpha,
  }

  shellvar { "/etc/default/passwd MINUPPER":
    variable => "MINUPPER",
    value    => $minupper,
  }

  shellvar { "/etc/default/passwd MINLOWER":
    variable => "MINLOWE",
    value    => $minlower,
  }

  shellvar { "/etc/default/passwd MINNONALPHA":
    variable => "MINNONALPHA",
    value    => $minnonalpha,
  }

  shellvar { "/etc/default/passwd MAXREPEATS":
    variable => "MAXREPEATS",
    value    => $maxrepeats,
  }

  shellvar { "/etc/default/passwd WHITESPACE":
    variable => "WHITESPACE",
    value    => $whitespace,
  }

  shellvar { "/etc/default/passwd DICTIONDBDIR":
    variable => "DICTIONDBDIR",
    value    => $dictiondbdir,
  }

  shellvar { "/etc/default/passwd DICTIONLIST":
    variable => "DICTIONLIST",
    value    => $dictionlist,
  }
}

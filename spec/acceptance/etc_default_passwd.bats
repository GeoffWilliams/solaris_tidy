@test "MAXWEEKS set" {
  grep "MAXWEEKS" /etc/default/passwd
}

@test "MINWEEKS set" {
  grep "MINWEEKS" /etc/default/passwd
}

@test "WARNWEEKS set" {
  grep "WARNWEEKS" /etc/default/passwd
}

@test "PASSLENGTH set" {
  grep "PASSLENGTH" /etc/default/passwd
}

@test "NAMECHECK set" {
  grep "NAMECHECK" /etc/default/passwd
}

@test "HISTORY set" {
  grep "HISTORY" /etc/default/passwd
}

@test "MINDIFF set" {
  grep "MINDIFF" /etc/default/passwd
}

@test "MINALPHA set" {
  grep "MINALPHA" /etc/default/passwd
}

@test "MINUPPER set" {
  grep "MINUPPER" /etc/default/passwd
}

@test "MINLOWE set" {
  grep "MINLOWE" /etc/default/passwd
}

@test "MINNONALPHA set" {
  grep "MINNONALPHA" /etc/default/passwd
}

@test "MAXREPEATS set" {
  grep "MAXREPEATS" /etc/default/passwd
}

@test "WHITESPACE set" {
  grep "WHITESPACE" /etc/default/passwd
}

@test "DICTIONDBDIR set" {
  grep "DICTIONDBDIR" /etc/default/passwd
}

@test "DICTIONLIST set" {
  grep "DICTIONLIST" /etc/default/passwd
}

@test "DICTIONLIST full entry set ok" {
  grep "DICTIONLIST=/usr/share/lib/dict/words" /etc/default/passwd
}

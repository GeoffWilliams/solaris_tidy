[![Build Status](https://travis-ci.org/GeoffWilliams/solaris_tidy.svg?branch=master)](https://travis-ci.org/GeoffWilliams/solaris_tidy)
# solaris_tidy

#### Table of Contents

1. [Description](#description)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Apply miscellaneous "tidying up" settings to Solaris (10)

## Setup

### What solaris_tidy affects

The module necessarily touches many parts of the system in order to perform the required changes.  Consult the module source code in order to understand what is going on under the hood.

Since `solaris_tidy` locks down critical security settings, its vital that user's understand how and why it works to prevent lockout or misconfiguration scenarios.

## Usage

Most classes will need to be loaded using the `class` resource syntax in order to pass the appropriate class defaults, eg:

```puppet
class { "foo:bar":
  param1 => "value1",
  param2 => "value2",
}
```

Parameters, where available, are documented inside the individual classes.  For a complete reference, either consult the [module source code](manifests) or the [puppet-strings](https://github.com/puppetlabs/puppet-strings) [generated documentation](doc/index.html).

## Reference

### Classes
`solaris_tidy::cron` Restrict access to cron
`solaris_tidy::disable_network_routing` Disable TCP connection forwarding
`solaris_tidy::disable_serial_login` Disable login on serial ports
`solaris_tidy::etc_default_init` Set daemon umask
`solaris_tidy::etc_default_keyserv` Entires in /etc/default/keyserv
`solaris_tidy::etc_default_login` Entries in /etc/default/login
`solaris_tidy::etc_default_passwd` Entries in /etc/default/passwd
`solaris_tidy::etc_security_policy` Entries in /etc/security/policy
`solaris_tidy::ftp` Lockdown the FTP daemon
`solaris_tidy::gnome` Lockdown Gnome
`solaris_tidy::inetd` Remove specified inetd services
`solaris_tidy::logging` Configure various options for logging
`solaris_tidy::mesg` Disable talk globally by default
`solaris_tidy::pam` Disable rlogin in pam
`solaris_tidy::password_policy_enforcement` Find and restrict users not complying with password policy
`solaris_tidy::permissions` General OS permissions
`solaris_tidy::protect_core_dumps` Configure core dumps
`solaris_tidy::stack_protection` Configure stack protection
`solaris_tidy::strong_tcp_sequence` Enable strong TCP sequence
`solaris_tidy::telnet` Disable telnet and set its banner
`solaris_tidy::umask_enforcement` Enforce correct umask in global login defaults

### Facts
* `openwin_installed` Detect the presence of openwin to see if Gnome can be locked down

## Limitations
* Solaris 10 only
* Not supported by Puppet, Inc.

## Development

PRs accepted :)

## Testing
This module supports testing using [PDQTest](https://github.com/GeoffWilliams/pdqtest).


Test can be executed with:

```
bundle install
bundle exec pdqtest all
```

See `.travis.yml` for a working CI example

# == Class: example_class
#
# Full description of class example_class here.
#
# === Parameters
#
# Document parameters here.
#
# [*ntp_servers*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*enc_ntp_servers*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { 'example_class':
#    ntp_servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@example.com>
#
# === Copyright
#
# Copyright 2011 Your name here, unless otherwise noted.
#

class user-profile-unix::config (
  $home = "/home/${user-profile-unix::username}",
  $email = "${user-profile-unix::username}@${user-profile-unix::domain}",
) inherits user-profile-unix {
  File {
    owner   => $user-profile-unix::username,
    group   => $user-profile-unix::gid,
  }

  #user { $username:
  #  ensure  => present,
  #  comment => $fullname,
  #  home    => $home,
  #  shell   => '/bin/bash',
  #  name    => $username,
  #  gid     => $gid,
  #}

  include user-profile-unix::config::ssl
  class {user-profile-unix::config::bash:
    links => [ '.bash_profile', '.bash_aliases', '.bashrc' ],
  }
  class {user-profile-unix::config::git:
    links => [ '.git-completion.bash', '.gitignore', '.gitconfig' ],
  }
  class {user-profile-unix::config::vim:
    links => [ '.vimrc' ],
  }
  class {user-profile-unix::config::screenrc:
    links => [ '.screenrc' ],
  }
}

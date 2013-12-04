# == Class: user-profile-unix::config
#
# Full description of class user-profile-unix::config here.
#
# === Parameters
#
# [*home*]
# [*email*]
#
# === Variables
#
# === Examples
#
#  class { 'user-profile-unix::config':
#  }
#
# === Authors
#
# Aaron Bernstein <dev@aaronbernstein@com>
#
# === Copyright
#
# Copyright 2013.
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

  class {user-profile-unix::config::ssl:
    keytype => "${user-profile-unix::keytype}",
    keyname => "${user-profile-unix::keyname}",
    key => "${user-profile-unix::key}",
  }
  class {user-profile-unix::config::bash:
    links => [ '.bash_profile', '.bash_aliases', '.bash_functions', '.bashrc' ],
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

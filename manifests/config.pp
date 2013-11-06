class user-profile-unix::config (
  $home = "/home/${user-profile-unix::username}",
  $email = "${user-profile-unix::username}@${user-profile-unix::domain}",  
) inherits user-profile-unix {
  File {
    owner   => $user-profile-unix::username,
    group   => $user-profile-unix::gid,
  }

  in clude user-profile-unix::config::ssl
  class {user-profile-unix::config::bash:
    links => $user-profile-unix::links
  }
  class {user-profile-unix::config::git:
    links => [ '.git-completion.bash', '.gitignore', '.gitconfig' ]
  }
  class {user-profile-unix::config::vim:
    links => [ '.vimrc' ]
  }
}
#user { $username:
#  ensure  => present,
#  comment => $fullname,
#  home    => $home,
#  shell   => '/bin/bash',
#  name    => $username,
#  gid     => $gid,
#}

$fullname = 'Aaron Bernstein'
$username = 'abernstein'
$email = "${username}@godaddy.com"
$gid = 'gdadusers'
$home = "/home/${username}"
$keyname = 'rsa-key-20121025'
$keytype = 'ssh-rsa'
$key = 'AAAAB3NzaC1yc2EAAAABJQAAAIEA3bsv8PYKbIzn5WrX6XeYBJoMIHWxB+0Ch/BVNtI2sWZaGpIQtGlNulwp5fxLQYiegrneDMxaoRtinpvY0HbcwVXXYi3p8jhCtksrwqUDYSG1TkO+3gZzlW4UQYOTmx0W/1LCDcA0KcpVGTOfiiv9tBuwVt/z4VJFiv7O4vJ1Pyc='

$links = [ ".bash_profile", ".bash_aliases", ".bashrc" ]

File {
  owner   => $username,
  group   => $gid,
}

file {[ $home, "${home}/.ssh" ]:
  ensure  => directory,
}

define symlink ($file) {
  file { "${home}/${file}":
    ensure => link,
    target => "puppet:///modules/user-profile-unix/${file}",
  }
}

symlink { $links: }

#user { $username:
#  ensure  => present,
#  comment => $fullname,
#  home    => $home,
#  shell   => '/bin/bash',
#  name    => $username,
#  gid     => $gid,
#}

# Developer Key
#ssh_authorized_key { $keyname:
#  ensure  => present,
#  key     => $key,
#  type    => $keytype,
#  name    => $email,
#  user    => $username,
#}

class user-profile-unix::config::ssl (
  $keytype = 'ssh-rsa',
  $keyname = 'rsa-key-20121025',
  $key = 'AAAAB3NzaC1yc2EAAAABJQAAAIEA3bsv8PYKbIzn5WrX6XeYBJoMIHWxB+0Ch/BVNtI2sWZaGpIQtGlNulwp5fxLQYiegrneDMxaoRtinpvY0HbcwVXXYi3p8jhCtksrwqUDYSG1TkO+3gZzlW4UQYOTmx0W/1LCDcA0KcpVGTOfiiv9tBuwVt/z4VJFiv7O4vJ1Pyc=',
) inherits user-profile-unix::config {  
  $home = $user-profile-unix::config::home

  file {[ $home, "${home}/.ssh" ]:
    ensure  => directory,
  }

  # Developer Key
  ssh_authorized_key { $keyname:
    ensure  => present,
    key     => $key,
    type    => $keytype,
    name    => $user-profile-unix::config::email,
    user    => $user-profile-unix::config::username,
  }
}

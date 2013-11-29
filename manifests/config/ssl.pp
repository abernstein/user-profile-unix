class user-profile-unix::config::ssl (
  $keytype = $user-profile-unix::params::keytype,
  $keyname = $user-profile-unix::params::keyname,
  $key = $user-profile-unix::params::key
) inherits user-profile-unix::config {
  $home = $user-profile-unix::config::home
  file {[ $home, "${home}/.ssh" ]:
    ensure  => directory,
  }
  ssh_authorized_key { $keyname:
    ensure  => present,
    key     => $key,
    type    => $keytype,
    name    => $user-profile-unix::config::email,
    user    => $user-profile-unix::config::username,
  }
}

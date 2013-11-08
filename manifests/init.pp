class user-profile-unix (
  $fullname = 'Aaron Bernstein',
  $username = 'abernstein',
  $domain = 'godaddy.com',
  $gid = 'gdadusers',
) inherits user-profile-unix::params {
  include user-profile-unix::config
}

include user-profile-unix

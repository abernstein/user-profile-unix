class user-profile-unix (
  $fullname = 'Aaron Bernstein',
  $username = 'abernstein',
  $domain = 'godaddy.com',
  $gid = 'gdadusers',
  $links = [ ".bash_profile", ".bash_aliases", ".bashrc" ],
) inherits user-profile-unix::params {
  include user-profile-unix::config
}

include user-profile-unix

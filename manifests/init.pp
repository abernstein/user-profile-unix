# == Class: user-profile-unix
#
# Full description of class user-profile-unix here.
#
# === Parameters
#
# Document parameters here.
#
# [*fullname*]
# [*username*]
# [*domain*]
#
# === Variables
#
# === Examples
#
#  class { 'user-profile-unix':
#    fullname => 'Aaron Bernstein',
#    username => 'abernstein',
#    domain => 'godaddy.com',
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
class user-profile-unix (
  $fullname = $user-profile-unix::params::fullname,
  $username = $user-profile-unix::params::username,
  $domain = $user-profile-unix::params::domain,
) inherits user-profile-unix::params {
  include user-profile-unix::config
}

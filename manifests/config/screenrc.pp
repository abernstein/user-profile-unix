class user-profile-unix::config::screenrc (
  $links,
) inherits user-profile-unix {
  user-profile-unix::config_file { $links:
    service => "screenrc",
  }
}

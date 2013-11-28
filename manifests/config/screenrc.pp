class user-profile-unix::config::screenrc (
  $links,
) inherits user-profile-unix {
  user-profile-unix::config-file { $links:
    service => "screenrc",
  }
}

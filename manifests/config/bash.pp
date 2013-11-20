class user-profile-unix::config::bash (
  $links,
) inherits user-profile-unix {
  user-profile-unix::config-file { $links:
    service => "bash",
  }
}

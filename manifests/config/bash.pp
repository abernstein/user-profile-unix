class user-profile-unix::config::bash (
  $links,
) inherits user-profile-unix {
  user-profile-unix::config_file { $links:
    service => "bash",
  }
}

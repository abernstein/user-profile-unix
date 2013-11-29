class user-profile-unix::config::git (
  $links,
) inherits user-profile-unix::config {
  user-profile-unix::config_file { $links:
    service => "git",
  }
}

class user-profile-unix::config::vim (
  $links,
) inherits user-profile-unix::config {
  user-profile-unix::config_file { $links:
    service => "vim",
  }
}

class user-profile-unix::config::vim (
  $links,
) inherits user-profile-unix::config {
  user-profile-unix::config-file { $links:
    service => "vim",
  }
}

class user-profile-unix::config::bash inherits user-profile-unix {
  user-profile-unix::config-file { $user-profile-unix::links:
    service => "bash",
  }
}

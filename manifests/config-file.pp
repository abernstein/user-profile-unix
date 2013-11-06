define user-profile-unix::config-file ($file=$title, $service) {
  $configFile = "${user-profile-unix::config::home}/${file}"
  file { "${configFile}":
    ensure => present,
    mode   => 0755,
    source => "puppet:///modules/${module_name}/${service}/${file}",
  }
  if ($service == "bash") {
    exec { "${configFile}":
      refreshonly => true,
      subscribe   => File["${configFile}"],
      command     => "/bin/bash -c 'source ${configFile}'",
    }
  }
}

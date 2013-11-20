define user-profile-unix::config-file ($service, $file=$title) {
  if (is_string($file, $service)) {
    include user-profile-unix::config
    $home = lookupvar("user-profile-unix::config::home")
    $config_dir = $service ? {
      "bin" => "${home}/${service}",
      default => "${home}",
    }
    $config_file = "${config_dir}/${file}"

    file { "${config_file}":
      ensure => present,
      mode   => "0755",
      source => "puppet:///modules/${module_name}/${service}/${file}",
    }

    if ($service == "bash") {
      exec { "${config_file}":
        refreshonly => true,
        subscribe   => File["${config_file}"],
        command     => "/bin/bash -c 'source ${config_file}'",
      }
    }
    $return = "Successfully, configured ${config_file}"
  } else {
    $return = "File and Service must be formated as strings"
  }
  notify { "${return}": }
}

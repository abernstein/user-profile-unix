# == Define: config_file
#
# Resource type config_file is a defined class for processing service configurations.
#
# === Parameters
#
# [*file*]
#   This parameter is set to default to the $class declaration's title.
#   This is meant to load from a config/${service} template.
#
# [*service*]
#   This parameter is required. It ties into the configuration files directory structure.
#
# === Examples
#
# Provide some examples on how to use this type:
#
#   class {user-profile-unix::config::bash:
#     links => [ '.bash_profile', '.bash_aliases', '.bashrc' ],
#   }
#
# === Authors
#
# Aaron Bernstein <dev@aaronbernstein.com>
#
# === Copyright
#
# Copyright 2013.
#
define user-profile-unix::config_file ($file=$title, $service) {
  $home = "${user-profile-unix::config::home}"
  $config_dir = $service ? {
    "bin" => "${home}/${service}",
    default => "${home}",
  }
  $config_resource = "${config_dir}/${file}"
  file { "${config_resource}":
    ensure => present,
    mode   => "0755",
    source => "puppet:///modules/${module_name}/${service}/${file}",
  }
  if ($service == "bash") {
    exec { "${config_resource}":
      refreshonly => true,
      subscribe   => File["${config_resource}"],
      command     => "/bin/bash -c 'source ${config_resource}'",
    }
  }
}

#
#
class perforce::install {

  user { $perforce::user:
    ensure     => present,
    home       => $perforce::service_root,
    managehome => true,
    system     => true,
  }
  # directory for perforce data
  -> file { $perforce::service_root:
    ensure => directory,
    owner  => $perforce::user,
    mode   => '0750',
  }

  # systemd template
  file { '/etc/systemd/system/p4d.service':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => epp('perforce/p4d.service.epp', {
      'user'    => $perforce::user,
      'pidfile' => "${perforce::service_root}/${perforce::service_name}.pid",
    }),
  }
  ~> exec { 'systemd refresh p4d.service':
    command     => 'systemctl daemon-reload',
    path        => [ '/usr/bin', '/bin', '/usr/sbin' ],
    refreshonly => true,
  }
}
# =Class perforce::configure
#
# ==Description
# Configures the perforce service via environment file
#
class perforce::configure {
  file { '/etc/profile.d/perforce':
    owner => 'root',
    group => 'root',
    mode  => '0644',
    content => epp('profile.epp', $perforce::settings)
  }
}
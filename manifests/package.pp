# =Class perforce::package
#
# ==Description
# Install the perforce packages
#
class perforce::package {
  package { 'perforce-server':
    ensure  => installed,
  }

  package { 'perforce-cli':
    ensure  => installed,
  }
}
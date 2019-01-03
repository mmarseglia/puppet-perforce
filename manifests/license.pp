# =Class perforce::license
#
# ==Description
# Installs perforce license.
#
class perforce::license {

  # perforce doesn't require a license and will support up to 5 users without one.
  # 
  # installing a license
  # https://www.perforce.com/perforce/doc.current/manuals/p4sag/Content/P4SAG/DB5-71632.html#License
  if ($perforce::license_content) {
    file { "${perforce::service_root}/license" :
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => $perforce::license_content,
    }
  }
}

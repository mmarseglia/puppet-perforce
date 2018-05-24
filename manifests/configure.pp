#
#
class perforce::configure {

  # configure p4d service
  exec { 'service p4d configure':
    command => "/opt/perforce/sbin/configure-helix-p4d.sh ${perforce::service_name} -n -p ${perforce::service_port} -r ${perforce::service_root} -u ${perforce::user}",
  }
}
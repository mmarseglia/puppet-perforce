# =Class perforce
#
# ==Description
# install and configure perforce
#
class perforce (
  String $user
){

  include perforce::user

  class { 'perforce::repository' : }
  -> class { 'perforce::package' : }

}

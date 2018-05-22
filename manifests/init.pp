# Perforce server
class perforce (
  String $user
){

  include perforce::user

  include perforce::repository

}

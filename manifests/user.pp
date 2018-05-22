class perforce::user (
  String $user = $perforce::user
){

  user { $user:
    ensure     => present,
    home       => '/var/local/perforce',
    managehome => true,
    system     => true,
  }

}
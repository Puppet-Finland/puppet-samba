# == Class: samba::winbind::service
#
# This class will install and start the winbind Samba service
#
# Parameters
#
#  $workgroup
#  $passwd_server
#  $realm
#  $security
#  $idmap_uid
#  $idmap_gid
#  $seperator
#  $shell
#  $use_default_domain
#  $offline_login
#
class samba::winbind::service (
  $winbind_ensure      = 'running',
  $workgroup           = undef,
  $passwd_server       = undef,
  $realm               = undef,
  $security            = undef,
  $idmap_uid           = undef,
  $idmap_gid           = undef,
  $seperator           = undef,
  $shell               = undef,
  $use_default_domain  = undef,
  $offline_login       = undef,
) inherits samba {

  service { 'winbind':
    ensure    => $winbind_ensure,
    name      => $samba::params::winbind_service,
    enable    => true,
    hasstatus => true,
    require   => Class['samba::winbind::install'],
  }
}

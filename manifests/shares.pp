# == Defninition: samba share definied type
#
# == Requires: Concat module
#
define samba::shares (
  # Share settings
  $share_name       = 'test',
  $template         = 'samba/shares.erb',
  $shares           = false,
  $share_seperator  = undef,
  $share_path       = undef,
  $share_public     = undef,
  $share_writeable  = undef,
  $share_users      = undef,
  $share_guest_ok   = undef,
) {

  include concat::setup

  if ! defined(Class['samba']) {
    fail('You must include the samba base class')
  }

  file { 'smb.conf':
    content => template($template),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['samba'],
    notify  => Service['$samba::params::samba_service'],
  }

}

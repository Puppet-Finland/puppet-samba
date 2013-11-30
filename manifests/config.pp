# == Class: samba::config
#
class samba::config inherits samba {

  file  { 'smb.conf':
    ensure  => file,
    path    => '/etc/samba/smb.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('samba/smb.conf.erb'),
  }

}

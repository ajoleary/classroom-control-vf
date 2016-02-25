
class nginx (
$package = $nginx::params::package,
$owner = $nginx::params::owner,
$group = $nginx::params::group,
$docroot = $nginx::params::docroot,
$confdir = $nginx::params::confdir,
$logdir = $nginx::params::logdir,
$user = $nginx::params::user,
) inherits nginx::params {

File {
owner => $owner,
group => $group,
mode=> '0664',
}

package { 'nginx':
ensure => present,
}

  file { 'index':
    ensure => file,
    path => "${docroot}/index.html",
    content => template('nginx/index.html.erb'),
  }
    
  file { 'config':
    ensure => file,
    path => "${confdir}/nginx.conf",
    content => template('nginx/nginx.conf.erb'),
    require => Package['nginx'],
    notify => Service['nginx'],
  }
  
  file { 'block':
    ensure => file,
    path => "${blockdir}/default.conf",
    content => template('nginx/default.conf.erb'),
    require => Package['nginx'],
    notify => Service['nginx'],
  }

  service { 'nginx':
    ensure => running,
    name => $service,
    require => [File['docroot'],File['index']],
    subscribe => [File['config'],File['block']],
  }

}


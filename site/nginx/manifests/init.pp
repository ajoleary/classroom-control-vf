class nginx 
{

case $::osfamily {
'RedHat':{
$package = 'nginx'
$owner = 'root'
$group = 'root'
$docroot = '/var/www'
$confdir = '/etc/nginx'
$blockdir = '/etc/nginx/conf.d'
$logdir = '/var/log/nginx'
$service = 'nginx'
$user = 'nginx'
}
'Debian':{
$package = 'nginx'
$owner = 'root'
$group = 'root'
$docroot = '/var/www'
$confdir = '/etc/nginx'
$blockdir = '/etc/nginx/conf.d'
$logdir = '/var/log/nginx'
$service = 'nginx'
$user = 'www-data'
}
'windows':{
$package = 'nginx-server'
$owner = 'Administrator'
$group = 'Administrators'
$docroot = 'C:/ProgramData/nginx/html'
$confdir = 'C:/ProgramData/nginx'
$blockdir = 'C:/ProgramData/nginx/conf.d'
$logdir = '/C:/ProgramData/nginx/logs'
$service = 'nginx'
$user = 'nobody'
}
'default':{
fail { "Get a supported operating system.":}
}
}

File {
owner => '$owner',
group => '$group',
mode=> '0664',
}


package { '$package':
ensure => present,
}


file { [ $docroot, "${confdir}/conf.d" ]:
ensure => directory,
}
file { "${docroot}/index.html":
ensure => file,
source => 'puppet:///modules/nginx/index.html',
}
file { "${confdir}/nginx.conf":
ensure => file,
content => template('nginx/nginx.conf.erb'),
notify => Service['nginx'],
}
file { "${confdir}/conf.d/default.conf":
ensure => file,
content => template('nginx/default.conf.erb'),
notify
}
service { 'nginx':
ensure => running,
enable => true,
}

}


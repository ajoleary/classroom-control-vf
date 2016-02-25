class nginx (
$root = '/srv/www/',
)
{
case $::osfamily {
'RedHat':{
$package = 'nginx'
$owner = 'root'
$group = 'root'
$defaultdocroot = '/var/www'
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
$defaultdocroot = '/var/www'
$confdir = '/etc/nginx'
$blockdir = '/etc/nginx/conf.d'
$logdir = '/var/log/nginx'
$service = 'nginx'
$user = 'www-data'
}
'windows':{
    $package  = 'nginx-service'
$owner = 'Administrator'
$group = 'Administrators'
$defaultdocroot = 'C:/ProgramData/nginx/html'
$confdir = 'C:/ProgramData/nginx'
$blockdir = 'C:/ProgramData/nginx/conf.d'
$logdir = 'C:/ProgramData/nginx/logs'
$service = 'nginx'
$user = 'nobody'
}
'default':{
fail { "Get a supported operating system.":}
}
}

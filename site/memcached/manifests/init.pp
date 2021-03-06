class memcached{


package { 'memcached':
ensure => present,
}

file { 'memcached-config':
ensure => file,
path => '/etc/sysconfig/memcached',
require => Package['memcached'],
source => 'puppet:///modules/memcached/memcached-config',
}

service { 'memcached':
ensure => running,
enable => true,
subscribe => File['memcached-config'],
}
}

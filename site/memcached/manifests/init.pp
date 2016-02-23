class memcached{


package { 'memcached':
ensure => present,
}

file 'memcached-config':
ensure => file,
path => '/etc/sysconfig/memcached',
require => Package [memecached],
source => 'puppet:///modules/memcached/memcached',
}

service { 'memcached':
ensure => running,
enable => true,
subscribe => File ['memcached-config'],
}
}

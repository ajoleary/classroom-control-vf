class memecached{


package { 'memecached':
ensure => present,
}

file 'memecached-config':
ensure => file,
require => Package [memecached],
}

service { 'memecached':
ensure => running,
enable =>
subscribe => File ['memecached-config']
}
}

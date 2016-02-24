class nginx {
package { 'nginx':
ensure => present,
}

file { 'docroot':
ensure => directory,
path => "/var/www",
}
file { 'index':
ensure => file,
path => "/var/www/index.html",
source => 'puppet:///modules/nginx/index.html',
}

file { 'config':
ensure => file,
path => '/etc/nginx/nginx.conf',
source => 'puppet:///modules/nginx/index.html',
}

file { 'block':
ensure => file,
path => "/etc/nginx/conf.d/default.conf",
source =>'puppet:///modules/nginx/nginx.conf,
}

}

define users::managed_user
{
user { $title:
ensure => present,
}
file { "/home/${title}":
ensure => directory,
owner => $title,
gid => $title,
}
file { "/home/$title/.ssh":
ensure => directory,
}
}

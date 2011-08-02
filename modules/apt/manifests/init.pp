#
# This great apt module is from the_ramlink in #puppet on Freenode
#

class apt::config {
    include apt::params

    File { owner => "root", group => "root", mode  => 0644, }

    file { "sources.list":
        ensure  => present,
        path    => "/etc/apt/sources.list",
        require => Class["apt::install"],
        source  => "puppet:///modules/apt/sources.list",
    }

    file { "/etc/apt/rkeys":
        ensure => directory,
        force   => true,
        purge   => true,
        recurse => true,
        require => Class["apt::install"],
        notify  => Class["apt::update"],
    }

    file { "/etc/apt/sources.list.d":
        ensure  => directory,
        mode    => 0755,
        force   => true,
        purge   => true,
        recurse => true,
        require => Class["apt::install"],
        notify  => Class["apt::update"],
    }
}

class apt::install {
    include apt::params

    package { "apt": ensure => present, }
    package { "apt-utils": ensure => present, }
    package { "aptitude": ensure => present, }
}

class apt::params {
}

class apt::update {

    include apt::params

    exec { "apt_update":
        command     => "apt-get update",
        path        => ["/usr/bin", "/usr/sbin"],
        logoutput   => on_failure,
        refreshonly => true,
        subscribe   => Class["apt::config"],
    }

}

class apt {
    include apt::params, apt::install, apt::config, apt::update
}

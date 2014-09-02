class iptables inherits arc_general_services {

#            package { iptables:
#                    ensure  => installed,
#            }
#
#            file { [ "/etc/iptables", "/etc/iptables/config-enabled" ]:
#                    ensure  => directory,
#                    mode    => 755,
#                    owner   => root,
#                    group   => root,
#            }
#
#
#            file { "/etc/network/if-up.d/iptables":
#                    ensure  => file,
#                    mode    => 755,
#                    source  => "/narnia/tools/initiptables.sh",
#                    require => [ package[iptables], exec[update-narnia] ]
#            }
	file { '/etc/iptables':
		source => 'puppet:///files/etc/iptables',
		ensure  => present,
		recurse => true,
		purge => true,
		force => true,
		mode    => 751,
		owner   => root,
		group   => root,
	}

	exec { "/etc/iptables/initiptables.sh":
		#subscribe      => file["/etc/iptables/config-available"],
		subscribe      => file["/etc/iptables"],
		refreshonly     => true,
		require         => [ 
			Package['iptables'],
			File['/etc/iptables']
		],
		notify => Exec['persist-firewall'],
	}

        exec { "persist-firewall":
                command => $operatingsystem ? {
                "Ubuntu" => "/sbin/iptables-save > /etc/iptables/rules.v4",
                "debian" => "/sbin/iptables-save > /etc/iptables/rules.v4",
                /(RedHat|CentOS)/ => "/sbin/iptables-save > /etc/sysconfig/iptables",
                },
                refreshonly => true,
        }

        Service ['iptables'] {
                ensure => running,
                enable => false,
        }

}

#
#
# Enable a certain script file by copying it from /etc/iptables/
#  config-available to /etc/iptables/config-enabled and running it.
#
#
define iptables::enable-iptables () {

	include iptables

	$script = "/etc/iptables/config-enabled/4/${title}.sh"

	# Make sure the file has the proper copy, and notify the iptables
	# script to run

	file { $script:
		ensure  => file,
		source  =>  "puppet:///files/etc/iptables/config-available/4/${title}.sh",
		mode => 755,
		require => File["/etc/iptables"],
		notify  => [
			Exec["/etc/iptables/initiptables.sh"],
			Service['fail2ban']
		]
	}
}

define enable-ip6tables () {

	include iptables

	$script = "/etc/iptables/config-enabled/6/${title}.sh"

	# Make sure the file has the proper copy, and notify the iptables
	# script to run

	file { $script:
		ensure  => file,
		source  =>  "puppet:///files/etc/iptables/config-available/6/${title}.sh",
		mode => 755,
		require => File["/etc/iptables"],
		notify  => [
			Exec["/etc/iptables/initiptables.sh"],
			Service['fail2ban']
		]
	}
}


class iptables::disable inherits iptables {

        Service ['iptables'] {
                ensure => stopped,
                enable => false,
        }

}

package Concrete::CMS::concrete5;

use strict;
use warnings;

our $VERSION = 0.7;
my $pkg = __PACKAGE__;

our $meta_info = {
    setphpsuexecvar => 1,
    adminuser_pass => 1, 
    admin_email    => 1, 
    installdir     => 'concrete5',
    adminuser_pass => 0,
    description    => 'Elegant and Powerful CMS', # required
    version        => '5.5.1', # required
    website        => 'http://www.concrete5.org/', 
    config_files   => ['config/site_install.php', 'config/site_install_user.php'],
    mysql          => ['c5'],
    chmod => {
        '0777' => ['files/','config/','packages/'],
		'0755' => ['concrete/libraries/3rdparty/htmldiff.py'],
    },
    chmod_recursive => 1,
    'install_fields' => {
		'admin_password' => {
			'label' => 'Password',
			'value' => '',
			'attr'  => 'size="10"',
			'type'  => 'password'
		},

		'vendor_license' => {
			'label' => '',
			'value' => $ENV{'SERVER_ADDR'},
			'type'  => 'hidden'
		}

	},
	
	
};

if ( defined &Cpanel::cPAddons::proc_keys_named_after_version ) {
   Cpanel::cPAddons::proc_keys_named_after_version( $meta_info, __PACKAGE__ );
}

#### action functions ##
sub install {
    my $cpo = shift;
    require Cpanel::Rand;
	use Digest::MD5 qw(md5_hex);
	
    $cpo->{'password_salt'} = Cpanel::Rand::getranddata(64);
    $cpo->{'admin_password_hash'} = md5_hex($cpo->{'input_admin_password'} . ':' . $cpo->{'password_salt'});

    $cpo->stdinstall(@_);
    $cpo->_do_phpsuexec_perms();
}


sub upgrade {}

sub uninstall { shift->stduninstall(@_) }

#### non action functions ##
sub installform { print shift->{installform} }
sub upgradeform { print shift->{upgradeform} }
sub uninstallform { print shift->{uninstallform} }

1;

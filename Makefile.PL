use ExtUtils::MakeMaker;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

WriteMakefile
(
	($] ge '5.005') ?
	(
		AUTHOR   => 'Ron Savage (ron@savage.net.au)',
		ABSTRACT => 'A web-based donations manager',
	) : (),
	clean =>
	{
		FILES => 'blib/* Makefile MANIFEST CGI-Office-Contacts-Donations*'
	},
	dist =>
	{
		COMPRESS => 'gzip',
		SUFFIX   => 'gz'
	},
	DISTNAME  => 'CGI-Office-Contacts-Donations',
	NAME      => 'App::Office::Contacts::Donations',
	PL_FILES  => {},
	PREREQ_PM =>
	{
		App::Office::Contacts => 0,
		Scalar::Util          => 0,
	},
	VERSION_FROM	=> 'lib/CGI/Office/Contacts/Donations.pm',
);

package App::Office::Contacts::Donations::View;

use App::Office::Contacts::Donations::View::Donations;
use App::Office::Contacts::View::Notes;
use App::Office::Contacts::View::Organization;
use App::Office::Contacts::View::Person;
use App::Office::Contacts::Donations::View::Report;

use Moose;

extends 'App::Office::Contacts::View';

has donations => (is => 'rw', isa => 'App::Office::Contacts::Donations::View::Donations');

use namespace::autoclean;

our $VERSION = '1.02';

# -----------------------------------------------

sub BUILD
{
	my($self) = @_;

	# Now App::Office::Contacts::View.Build() calls init().

}	# End of BUILD.

# --------------------------------------------------

sub init
{
	my($self) = @_;

	$self -> log(debug => 'Entered init');

	$self -> donations(App::Office::Contacts::Donations::View::Donations -> new
	(
		config    => $self -> config,
		db        => $self -> db,
		logger    => $self -> logger,
		session   => $self -> session,
		tmpl_path => $self -> tmpl_path,
	) );

	$self -> notes(App::Office::Contacts::View::Notes -> new
	(
		config    => $self -> config,
		db        => $self -> db,
		logger    => $self -> logger,
		session   => $self -> session,
		tmpl_path => $self -> tmpl_path,
	) );

	$self -> organization(App::Office::Contacts::View::Organization -> new
	(
		config    => $self -> config,
		db        => $self -> db,
		logger    => $self -> logger,
		session   => $self -> session,
		tmpl_path => $self -> tmpl_path,
	) );

	$self -> person(App::Office::Contacts::View::Person -> new
	(
		config    => $self -> config,
		db        => $self -> db,
		logger    => $self -> logger,
		session   => $self -> session,
		tmpl_path => $self -> tmpl_path,
	) );

	$self -> report(App::Office::Contacts::Donations::View::Report -> new
	(
		config    => $self -> config,
		db        => $self -> db,
		logger    => $self -> logger,
		session   => $self -> session,
		tmpl_path => $self -> tmpl_path,
	) );

} # End of init.

# --------------------------------------------------

__PACKAGE__ -> meta -> make_immutable;

1;

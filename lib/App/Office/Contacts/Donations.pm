package App::Office::Contacts::Donations;

use strict;
use warnings;

# We don't use Moose because we isa CGI::Application.

our $VERSION = '1.02';

# -----------------------------------------------

1;

=head1 NAME

C<App::Office::Contacts::Donation> - A web-based donations manager

=head1 Synopsis

Run /cgi-bin/office/contacts.cgi or /office/contacts, both of which are shipped with
C<App::Office::Contacts>.

They will have extra features now that you have installed C<App::Office::Contacts::Donation>.

=head1 Description

C<App::Office::Contacts::Donations> implements web-based, personal and group, donations.

=head1 Distributions

This module is available as a Unix-style distro (*.tgz).

See http://savage.net.au/Perl-modules/html/installing-a-module.html for
help on unpacking and installing distros.

=head1 Installation Pre-requisites

=head2 App::Office::Contacts

C<App::Office::Contacts::Donations> contains some files which overwrite files shipped with
C<App::Office::Contacts>.

=head1 Install the module

Install C<App::Office::Contacts::Donations> as you would for any C<Perl> module:

Run I<cpan>: shell>sudo cpan App::Office::Contacts::Donations

or unpack the distro, and then either:

	perl Build.PL
	./Build
	./Build test
	sudo ./Build install

or:

	perl Makefile.PL
	make (or dmake)
	make test
	make install

Either way, you'll need to install all the other files which are shipped in the distro.

=head2 Install the C<HTML::Template> files.

Copy the distro's htdocs/assets/ directory to your doc root.

Specifically, my doc root is /home/ron/httpd/prefork/htdocs/, so I end up with
/home/ron/httpd/prefork/htdocs/assets/.

=head2 Creating and populating the database

The distro contains a set of text files which are used to populate constant tables.
All such data is in the data/ directory.

This data is loaded into the 'contacts' database using programs in the distro.
All such programs are in the scripts/ directory.

After unpacking the distro, create and populate the database:

	shell>cd CGI-Office-Contacts-1.00
	shell>perl -Ilib scripts/drop.tables.pl -v
	shell>perl -Ilib scripts/create.tables.pl -v
	shell>perl -Ilib scripts/populate.tables.pl -v
	shell>perl -Ilib scripts/report.tables.pl -v

Note: The '-Ilib' means 2 things:

=over 4

=item Perl looks in the current directory structure for the modules

That is, Perl does not use the installed version of the code, if any.

=item The code looks in the current directory structure for .htoffice.contacts.conf

That is, it does not use the installed version of this file, if any.

=back

So, if you leave out the '-Ilib', Perl will use the version of the code which has been
formally installed, and then the code will look in the same place for .htoffice.contacts.conf.

=head2 Start testing

Point your broswer at http://127.0.0.1/cgi-bin/contacts.cgi (trivial script), or
http://127.0.0.1/office/contacts (fancy script).

=head1 FAQ

=over 4

=item Where does the list of currencies come from?

http://au.finance.yahoo.com/currency

Save this page in data/currencies.html, and run scripts/currency.codes.pl.

=item I'm having trouble dropping and recreating the tables.

Firstly, drop the tables associated with donations, then the basic tables. Then recreate them.

=over 4

=item Donation tables

cd CGI-Office-Contacts-Donations
scripts/drop.tables.pl -v

=item Basic tables

cd CGI-Office-Contacts
scripts/drop.tables.pl -v
scripts/create.tables.pl -v
scripts/populate.tables.pl -v
scripts/report.tables.pl -v

=item Donation tables

cd CGI-Office-Contacts-Donations
scripts/create.tables.pl -v
scripts/populate.tables.pl -v
scripts/report.tables.pl -v

=back

=back

=head1 Author

C<App::Office::Contacts::Donations> was written by Ron Savage I<E<lt>ron@savage.net.auE<gt>> in 2009.

Home page: http://savage.net.au/index.html

=head1 Copyright

Australian copyright (c) 2009, Ron Savage. All rights reserved.

	All Programs of mine are 'OSI Certified Open Source Software';
	you can redistribute them and/or modify them under the terms of
	The Artistic License, a copy of which is available at:
	http://www.opensource.org/licenses/index.html

=cut

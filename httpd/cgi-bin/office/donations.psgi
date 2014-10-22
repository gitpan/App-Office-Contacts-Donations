#!/usr/bin/perl
#
# Run with:
# start_server --port=127.0.0.1:5004 -- starman --workers 1 httpd/cgi-bin/office/donations.psgi &
# or
# plackup --host 127.0.0.1 --port 5004 httpd/cgi-bin/office/donations.psgi &

use strict;
use warnings;

use CGI::Application::Dispatch::PSGI;

use Plack::Builder;

# ---------------------

my($app) = CGI::Application::Dispatch -> as_psgi
(
	prefix => 'App::Office::Contacts::Donations::Controller',
	table  =>
	[
	''              => {app => 'Initialize', rm => 'display'},
	':app'          => {rm => 'display'},
	':app/:rm/:id?' => {},
	],
);

builder
{
	enable "Plack::Middleware::Static",
	path => qr!^/(assets|yui)/!,
	root => '/var/www';
	$app;
};

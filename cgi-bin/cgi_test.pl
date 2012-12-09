#!/usr/bin/perl
use warnings; use strict;
use CGI;
my $cgi = CGI->new();
print $cgi->header(-charset=>'utf8'),
	  $cgi->start_html('hello'),
	  $cgi->h1("挺好的"),
	  $cgi->end_html();

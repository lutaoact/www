#!/usr/bin/perl
use warnings; use strict;
use HTML::Template::Pro;
use CGI;
my $cgi = CGI->new;
my $html = HTML::Template::Pro->new(filename=>'tmpl_test.tmpl');
print $cgi->header(-charset=>'utf8');
$html->param(bool=>1);
print $html->output;

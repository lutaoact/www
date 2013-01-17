#!/usr/bin/perl
use warnings; use strict;
use HTML::Template::Pro;
use CGI;
my $cgi = CGI->new;
my $html = HTML::Template::Pro->new(filename=>'tmpl_test2.tmpl');
print $cgi->header(-charset=>'utf8');
$html->param(loop=>[{name=>'bobby', nickname=>[{name=>'he-man'}, {name=>'ha-man'}],}]);
print $html->output;

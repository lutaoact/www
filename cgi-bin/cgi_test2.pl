#!/usr/bin/perl
use warnings; use strict;
use CGI;
my $cgi = CGI->new;
print $cgi->header(-charset=>'utf8'),
$cgi->start_html('test cgi'),
$cgi->p('hello world');
if ($cgi->param())
{
    print 'your name is ', $cgi->param('name'), "\n";
}
print $cgi->end_html();

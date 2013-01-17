#!/usr/bin/perl
use warnings; use strict;
use CGI qw(:standard);
my $cgi = new CGI;
print $cgi->header(),
      $cgi->start_html('A simple Example'),
      $cgi->h1('Example');
if ($cgi->param())
{
    print "Your name is ", $cgi->param('name');
}
print $cgi->end_html();

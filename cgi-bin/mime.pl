#!/usr/bin/perl
use warnings; use strict;
use CGI;
my $cgi = CGI->new();
print $cgi->header,
      $cgi->start_html,
      "Your browser accepts:",
      $ENV{HTTP_ACCEPT},
      $cgi->end_html;

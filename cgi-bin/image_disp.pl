#!/usr/bin/perl
use warnings; use strict;
use CGI;
my $cgi = CGI->new;
print $cgi->header(-charset=>'utf8'),
      $cgi->start_html('images from CGI scripts'),
      $cgi->center($cgi->p('images from CGI scripts'), $cgi->img({-src=>'image_test.pl', -height=>'100', -width=>'300'}), $cgi->img({-src=>'image_test2.pl', -height=>'100', -width=>'300'})),
      $cgi->end_html;

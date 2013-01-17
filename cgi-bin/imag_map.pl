#!/usr/bin/perl
use warnings; use strict;
use CGI;
my $cgi = CGI->new();
print $cgi->header,
      $cgi->start_html('Image Map Example'),
      $cgi->h1('Image Map Example'),
      $cgi->start_form,
      $cgi->image_button
      (
       -name=>'map',
       -src=>'../jpg/2.jpg'
      ),
      $cgi->p,
      $cgi->end_form,
      $cgi->hr;
if ($cgi->param())
{
    my $x = $cgi->param('map.x');
    my $y = $cgi->param('map.y');
    print "You clicked the map at ($x, $y)";
}
    print $cgi->end_html;


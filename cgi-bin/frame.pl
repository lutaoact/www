#!/usr/bin/perl
use CGI;
use strict; use warnings;
my $cgi = CGI->new;
print $cgi->header,
      $cgi->frameset({-cols=>'30%,60%'},
              $cgi->frame
              ({
               -noresize=>'noresize',
               -name=>'top',
               -src=>'../jpg/1.jpg'
               }),
              $cgi->frame
              ({
               -name=>'bottom',
               -src=>'../jpg/2.jpg'
               })
              );

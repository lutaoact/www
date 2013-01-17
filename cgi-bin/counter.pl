#!/usr/bin/perl
use warnings; use strict;
use CGI;
my $cgi = CGI->new;
open (COUNT, '<count.dat') or die "Cound not open counter data file";
my $count = <COUNT>;
close COUNT;
$count++;
open (COUNT, '>count.dat');
print COUNT $count;
close COUNT;
print $cgi->header(-charset=>'utf8'),
      $cgi->start_html('Counter Example'),
      $cgi->center($cgi->p('Counter Example'), $cgi->p('Current count: ', $count), $cgi->p('Reload the page to update the count')),
      $cgi->end_html;

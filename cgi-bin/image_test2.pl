#!/usr/bin/perl
use warnings; use strict;
use CGI;
my $cgi = CGI->new();
open(IMAGE, "<jpg/2.jpg");
my ($size, $data);
$size = -s "jpg/2.jpg";
read IMAGE, $data, $size;
close IMAGE;
print $cgi->header(-type=>'image/jpeg'), $data;

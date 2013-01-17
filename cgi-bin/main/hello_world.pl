#!/usr/bin/perl
use strict;
use warnings;
use CGI;
my $q = new CGI;
print $q->header(), $q->start_html("hello perl world!"), $q->h1("hello world"), $q->end_html();

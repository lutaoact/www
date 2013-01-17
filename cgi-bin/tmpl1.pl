#!/usr/bin/perl
use strict; use warnings;
use HTML::Template;
my $html = new HTML::Template(filename=>"html.tmpl");
$html->param(TEST=>'hello!');
open OUT, ">../2.html";
print OUT $html->output;
close OUT;

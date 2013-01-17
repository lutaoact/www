#!/usr/bin/perl
use strict; use warnings;
use HTML::Template;
my $html = new HTML::Template(filename=>"html2.tmpl");
$html->param(name=>[{name=>'tom', age=>'21'}, {name=>'lutao', age=>'23'}]);
open OUT, ">2.html";
print OUT $html->output;
close OUT;

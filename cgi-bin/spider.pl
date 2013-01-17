#!/usr/bin/perl
use strict; use warnings;
use Database;
use CGI;
my $cgi = new CGI;
print $cgi->header(-charset=>'utf8'), $cgi->start_html("Spider Program"), $cgi->h1("renren booklist");
my @list_items = Database::select();
foreach (@list_items)
{
    my %data = %$_;
    print $cgi->div("$data{id} $data{name}");
}
print $cgi->end_html();
exit(0);

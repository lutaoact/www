#!/usr/bin/perl
use warnings; use strict;
use CGI;
my $cgi = CGI->new;
open BOOK, "+<book.html" or die "could not open guest book";
seek (BOOK, -length($cgi->end_html), 2);
my $date = `date`;
chop($date);
my $username = $cgi->param('username');
$username =~ s/</&lt;/g;
my $text = $cgi->param('comments');
$text =~ s/</&lt;/g;
print BOOK
$cgi->p("new comments by ", $username, " on ", $date, $cgi->p, $text),
    $cgi->hr;
#$cgi->end_html;
close BOOK;
print $cgi->header,
      $cgi->start_html('guest book example'),
      $cgi->center($cgi->p("thanks for adding to the guest book")),
      $cgi->a({href=>"../cgi-bin/book.html"}, "click here"),
      $cgi->hr,
      $cgi->end_html;

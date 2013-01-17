#!/usr/bin/perl
use warnings; use strict;
use CGI;
my $cgi = CGI->new;
print $cgi->header,
      $cgi->start_html('Email Example');
if ($cgi->param())
{
    my ($from, $subject, $text);
    $from = $cgi->param('name');
    $from =~ s/@/\@/;
    $subject = $cgi->param('subject');
    $text = $cgi->param('text');
    $text =~ s/</&lt;/g;
    open (MAIL, '| /usr/lib/sendmail -t -oi');
    print MAIL <<EOF;
To: lutaoact\@139.com
From: $from
Subject: $subject
$text
EOF
    close MAIL;
}
print $cgi->center($cgi->h1('Thanks for sending me email!')),
      $cgi->hr,
      $cgi->end_html;

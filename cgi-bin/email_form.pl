#!/usr/bin/perl
use warnings; use strict;
use CGI;
my $cgi = CGI->new;
print $cgi->header,
      $cgi->start_html('send me some email'),
      $cgi->center($cgi->p('send me some email!')),
      $cgi->hr,
      $cgi->start_form
      (-method=>"POST",
       -action=>"email.pl"),
      "Please enter your email address:",
      $cgi->p($cgi->textfield('name')),
      "Please enter your email subject:",
      $cgi->p($cgi->textfield('subject')),
      $cgi->p("Please enter the email you want send:"),
      $cgi->textarea(-name=>"text", -rows=>10, -cols=>60, -value=>"Dear you:"),
      $cgi->center($cgi->submit, $cgi->reset),
      $cgi->hr,
      $cgi->end_form,
      $cgi->end_html;


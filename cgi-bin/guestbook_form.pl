#!/usr/bin/perl
use warnings; use strict;
use CGI;
my $cgi = CGI->new;
print $cgi->header(),
      $cgi->start_html('Add to the guest book'),
      $cgi->p('Please add to the guest book'),
      $cgi->start_form
      ({
       -method=>'POST',
       -action=>'guestbook.pl'}),
      $cgi->center($cgi->p("Please enter your name:"), $cgi->p($cgi->textfield('username')), $cgi->p("please enter your comments:"), $cgi->p($cgi->textarea(-name=>'comments', -rows=>8, -cols=>40))),
      $cgi->center($cgi->submit(-value=>'Send'), $cgi->reset(-value=>'Rst')),
      $cgi->end_form,
      $cgi->end_html;

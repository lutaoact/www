#!/usr/bin/perl
use warnings; use strict;
use CGI;
my $cgi = CGI->new();
print $cgi->header,
$cgi->start_html
(
    -title=>'CGI Perl',
    -author=>'Steve',
    -meta=>{'keywords'=>'CGI Perl'},
    -BGCOLOR=>'white',
    -LINK=>'red'
    ),
$cgi->center
(
 $cgi->h1('Thanks for filling out our survey.')
 ),
$cgi->h3('Here are your responses...'),
$cgi->hr;
if ($cgi->param())
{
    print "Your name is: ", $cgi->param('text'), $cgi->p,
          "Your opinions are: ", $cgi->param('textarea'), $cgi->p,
          "You use these products: ", join(", ", $cgi->param('checkboxes')), $cgi->p,
          "Your income level is : ", $cgi->param('list'), $cgi->p,
          "Today is day ", $cgi->param('radios'), " of the week.", $cgi->p,
          "Your password is: ", $cgi->param('password'), $cgi->p,
          "How much unsolicited mail you like: ", $cgi->param('popupmenu'), $cgi->p,
         "The hidden data is ", join(', ', $cgi->param('hiddendata'));
}
print $cgi->hr;
print $cgi->end_html;

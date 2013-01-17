#!/usr/bin/perl
use CGI;
use warnings; use strict;
my $cgi = CGI->new();
my %labels = (1=>'sunday', 2=>'monday', 3=>'tuesday', 4=>'wednesday', 5=>'thursday', 6=>'friday', 7=>'saturday');
print $cgi->header(),
$cgi->start_html
(
    -title=>'CGI example',
    -author=>'Steve',
    -meta=>{'keywords'=>'CGI Perl'},
    -BGCOLOR=>'white',
    -LINK=>'red'
    ),
$cgi->center($cgi->img({-src=>'../cgi-bin/jpg/2.jpg'})), 
$cgi->center($cgi->h1('Here is the Survey')),
$cgi->h2('Please fill out our survey...'),
"reasons for filling out our survey:",
$cgi->ul
(
    $cgi->li('Fame'),
    $cgi->li('Fortune'),
    $cgi->li('Fun'),
    ),
"If you would rather not fill out our survey, ",
"you might be interested in ",
$cgi->a({href=>'http://www.cpan.org/'}, "CPAN"), ".",
$cgi->hr,
$cgi->start_form
(
    -method=>'POST',
    -action=>'cgi2.pl'
),
"Please enter your name:",
$cgi->textfield('text'), $cgi->p,
"Please enter your opinion:",
$cgi->p,
$cgi->textarea
(
    -name=>'textarea',
    -default=>'No opinion',
    -rows=>10,
    -columns=>60
),
$cgi->p,
"Please indicate what products you use: ", $cgi->p,
$cgi->checkbox_group
(
 -name=>'checkboxes',
 -value=>[qw(shampoo toothpaste bread cruise)],
 -default=>[qw(bread cruise)]
 ), $cgi->p,
"please indicate your income level:", $cgi->p,
$cgi->scrolling_list
(
    'list',
    [qw(highest high medium low)],
    'high'
), $cgi->p,
"please indicate the day of the week:", $cgi->p,
$cgi->radio_group
(
 -name=>'radios',
 -value=>[qw(1 2 3 4 5 6 7)],
 -default=>'1',
 -labels=>\%labels
 ), $cgi->p,
"please enter your password", $cgi->p,
$cgi->password_field
(
 -name=>'password',
#-default=>'open sesame',
 -size=>30,
), $cgi->p,
"Thank you for filling out our Survey. Please indicate how much unsolicited mail you like to get: ",
$cgi->popup_menu
(
 -name=>'popupmenu',
 -values=>['very much', 'A lot', 'Not so much', 'None']
 ),
$cgi->p,
$cgi->hidden
(
 -name=>'hiddendata',
 -default=>'Rosebud'
 ),
$cgi->center
(
 $cgi->submit('Submit'),
 $cgi->reset('Reset'),
 ),
$cgi->hr,
$cgi->end_form,
$cgi->end_html;

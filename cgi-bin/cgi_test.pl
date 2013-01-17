#!/usr/bin/perl
use CGI;
$cgi = CGI->new();
print $cgi->header(-charset=>'utf8'),
      $cgi->start_html(-title=>'CGI example'),
      $cgi->center($cgi->h1('Welcome to CGI')),
      $cgi->start_form(),
      $cgi->textarea(-name=>'textarea', -value=>'hello', -rows=>10, -columns=>60),
      $cgi->end_form,
      $cgi->p({-align=>'center'}, ['Welcom to CGI', 'hello world']),
      $cgi->end_html;



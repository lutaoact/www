#!/usr/bin/perl
use warnings; use strict;
use CGI;
my $cgi = CGI->new();
print $cgi->header(-charset=>'utf-8'),
      $cgi->start_html('File Upload');
unless($cgi->param())
{
    print $cgi->center
          (
           $cgi->p('File Upload'),
           $cgi->start_multipart_form(),
           $cgi->filefield(-name=>'filename', -size=>30),
           $cgi->br,
           $cgi->submit(-value=>'upload'),
           $cgi->reset(-value=>'clear'),
           $cgi->end_form
          ),
          $cgi->hr;
}
else
{
    my $file = $cgi->param('filename');
    print $file;
    open OUT, ">upload/$file";
    print OUT <$file>;
    print $cgi->p('success');
}
print $cgi->end_html;

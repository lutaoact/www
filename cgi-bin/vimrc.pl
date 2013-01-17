#!/usr/bin/perl
use warnings;
use strict;
use utf8;
open OUT, ">vimrc.txt";
binmode(OUT, ':encoding(utf8)');
open OUT2, ">vimrc2.txt";
my $url = 'http://wyw.dcweb.cn/vim/_vimrc.html';
use LWP::Simple;
my $content = get $url;
die "Couldn't get $url" unless defined $content;
my $divHead = "<pre>";
my $divEnd = "</pre>";
if ($content =~ /$divHead(.*?)$divEnd/s)
{
	$_ = $1;
	s/<.*?>//g; 
	#s/^\s+$//g; 
	#s/\n//;
    print OUT;
}
open IN, "<vimrc.txt";
foreach (<IN>)
{
	chomp;
	s/&quot;/"/g;
    print OUT2;
}
close OUT;
close OUT2;

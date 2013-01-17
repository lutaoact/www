#!/usr/bin/perl
use strict; use warnings;
use LWP::UserAgent;
use HTTP::Cookies;
use HTTP::Headers;
use Database; use CGI; use Encode;
#binmode(STDOUT, ':encoding(utf8)');
my $ua = LWP::UserAgent->new(keep_alive=>1);
$ua->timeout(5);
$ua->agent('Mozilla/11.0');
$ua->cookie_jar(HTTP::Cookies->new(file=>'get_page_login.cookies', autosave=>1));
my $res = $ua->post('http://www.renren.com/ajaxLogin/login',
    [
        email=>'lutao.@126.com',
        password=>'200713013',
        autoLogin=>'true',
        origURL=>'http://www.renren.com/home',
        domain=>'renren.com',
        key_id=>'1',
        _rtk=>'1c63dedf',
    ],
);
print STDERR $res->status_line."\n" unless $res->is_success;
my $req = HTTP::Request->new(GET=>'http://page.renren.com/601283398/note/812125975');
$req->content_type('application/x-www-form-urlencoded');
$res = $ua->request($req);
my $content =  $res->as_string();
my $divHead = '<div class="text-article" id="blogContent">';
my $divEnd = '</div>';
my @list;
if ($content =~ /$divHead(.*?)$divEnd/s)
{
    $_ = $1;
    s#<!.*?>##;
    s#<p>.*?</p>##;
    s/\s+//g;
    @list = split /<br>/, $_;
#    printf "%s\n" x @list, @list;
}
Database::insert(@list);
Database::select();
exit(0);

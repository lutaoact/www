#!/usr/bin/perl
use strict; use warnings;
use LWP::UserAgent;
use HTTP::Cookies;
use HTTP::Headers;
use DBI; use CGI; use HTML::Template::Pro; 
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
    s%<!.*?>%%;
    s%<p>.*?</p>%%;
    s/\s+//g;
    @list = split /<br>/, $_;
}
my $dsn = "DBI:mysql:database=test_lutao;hostname=localhost";
my $username = "root";
my $password = "111111";
my ($dbh, $sth);
$dbh = DBI->connect($dsn, $username, $password, {RaiseError=>1, PrintError=>0});
my $rows;
$rows = $dbh->do(qq{delete from Catalog});
$rows = $dbh->do(qq{alter table Catalog auto_increment=1});
foreach (@list)
{
    $_ = $dbh->quote("$_");
    $rows = $dbh->do(qq{insert into Catalog(name) values($_)});
}#所有的数据至此全部插入了数据库表中
$sth = $dbh->prepare("select * from Catalog");
$sth->execute();
my @ary;
my $html = HTML::Template::Pro->new(filename=>"spider_html.tmpl");
$html->param(h1=>'renren booklist');
my @loop_data = ();
while(@ary = $sth->fetchrow_array())
{
    push (@loop_data, {id=>$ary[0], name=>$ary[1]});
}
my $cgi = new CGI;
print $cgi->header(-charset=>'utf8');
$html->param(name=>\@loop_data);
print $html->output;
$sth->finish();
$dbh->disconnect();
exit(0);

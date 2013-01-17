#!/usr/bin/perl
use strict;
use warnings;

use DBI;
use LWP::UserAgent;
use HTTP::Cookies;
use HTTP::Request;
use HTTP::Response;

my $ua = LWP::UserAgent->new;

sub decide_need_of_proxy {
    my ($login_url) = @_;
    my $return;
    $ua->timeout(3);
    my $request = HTTP::Request->new( GET => $login_url );
    my $response = $ua->request($request);
    if ( $response->is_success ) {
        $return = $response->decoded_content;
    }
    else {
        $return = $response->status_line;
        print "\n\n".$return."\n\n";
    }
    if ( $return =~ m/200/ ) {
        return 1;
    }
    else {
        return 0;
    }
}

sub login_proxy {
    my ( $proxy, $proxy_user, $proxy_password ) = @_;
    $ua->proxy(
        'http' => "http://$proxy_user:$proxy_password" . '@' . "$proxy" );
}

sub get_response_of_login {
    my %info      = @_;
    print %info;
    my $login_url = $info{"login_url"};
    my $login_user = $info{"username"};
    my $login_password  = $info{"password"};
    $ua->timeout(3);
    $ua->agent('Mozilla/5.0');
    $ua->default_header( 'Accept-Encoding' => 'UTF-8' );
    my $res     = $ua->get($login_url);
    my $cookie1 = $res->header('Set-Cookie');
    $cookie1 =~ /trac_form_token=(\w+);/;
    my $form_token   = $1;
    my %form_content = (
        'user'         => $login_user,
        'password'     => $login_password,
        '__FORM_TOKEN' => $form_token,
        'referer'      => $login_url
    );
    my $response_post =
      $ua->post( $login_url, \%form_content, 'Cookie' => $cookie1 );
    return $response_post;
}

sub get_response_of_url {
    my ( $response_post, $target_url ) = @_;
    my $cookie2;
    $cookie2 = $response_post->header('Set-Cookie');
    my $response_tickets = $ua->get( $target_url, 'Cookie' => $cookie2 );
    return $response_tickets;
}

sub match_regular_expression {
    my ($response_tickets) = @_;
    my ( @array, $rinfo );
    foreach my $str ( $response_tickets->content =~
m{(<td class="id">\s*<a href=".+?" title="View ticket">.+?</a>\s*</td>\s*<td class="summary">\s*<a href=".+?" title="View ticket">.+?</a>)}g
      )
    {
        if ( $str =~
m{<td class="id">\s*<a href=".+?" title="View ticket">(.+?)</a>\s*</td>\s*<td class="summary">\s*<a href="(.+?)" title="View ticket">(.+?)</a>}
          )
        {
            $rinfo = { ticknum => $1, url => $2, choice => $3 };
            push( @array, $rinfo );
        }
    }
    return @array;
}

sub insert_data_base {
    my @array = @_;
    my $dbh =
      DBI->connect( 'dbi:mysql:database=test_yixin;host=127.0.0.1;port=3306',
        'root', '111111' );
    foreach (@array) {
        my $sth = $dbh->prepare(
            'insert into crawltick (ticknum, url, choice) values (?, ?, ?)');
        my $data_base_content = $_;
        $sth->execute(
            $data_base_content->{ticknum},
            $data_base_content->{url},
            $data_base_content->{choice}
        );
    }
    $dbh->disconnect;
}

sub export_to_html {
    my @array = @_;
    print "Content-type: text/html;\n\n";
    print
"<html><head><meta http-equiv='content-type' content='text/html;charset=UTF-8'></head>\n<body>";
    print "\n";
    foreach $_ (@array) {
        print "$_->{ticknum}\t$_->{url}\t$_->{choice}\n";
    }
    print "</body></html>";
}

sub main {
    my $username  = "yixin.wang";
    my $password  = "123456";
    my $login_url = "http://10.132.24.11/cgi-bin/training.cgi/login";
    my $target_url =
"http://10.132.24.11/cgi-bin/training.cgi/query?status=!closed&owner=yixin.wang&report=20";
    my $proxy          = "61.155.158.67:62000";
    my $proxy_user     = "yixin.wang";
    my $proxy_password = "yixin.wang";
    my @proxyinfo      = ( $proxy, $proxy_user, $proxy_password );
    my $proxy_control  = decide_need_of_proxy($login_url);
    login_proxy(@proxyinfo);
    my $response_post = get_response_of_login(
        "username"  => $username,
        "password"  => $password,
        "login_url" => $login_url
    );
    my $response_tickets = get_response_of_url( $response_post, $target_url );
    my @array = match_regular_expression($response_tickets);
    insert_data_base(@array);
    export_to_html(@array);
}

main();

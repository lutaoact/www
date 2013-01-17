#!/usr/bin/perl
use warnings;
use strict;
use utf8;
#编码中有汉字，所以直接使用utf8这个模块，就不需要单独解码了
use Encode;
use LWP::UserAgent;
use HTTP::Request;
use constant ORIGIN_URL => 'http://news.iciba.com/dailysentence';

main();

sub main {
    open OUT, ">daily_sentence.txt";
    binmode( OUT,    ':encoding(utf8)' );
    binmode( STDOUT, ':encoding(utf8)' );
    #解决输出错误character的问题

    my $content       = get_content(ORIGIN_URL);
    my @final_matches = grep_content($content);
    my $next_page_url;
    for ( my $i = 0; $i < 10; $i++ ) {
        $next_page_url = get_next_page_url($content);
        $content       = get_content($next_page_url);
        my @matches = grep_content($content);
        push @final_matches, @matches;
    }
    print OUT @final_matches;
    close OUT;
}

sub get_next_page_url {
    my ($content) = @_;
    my $match_head
        = qr(<a title='下一页' target='_self' href='./dailysentence);
    my $next_page_url;
    if ( $content =~ /$match_head(-\d+-\d+-\d+\.html)/ ) {
        $next_page_url = ORIGIN_URL . $1;
    }
    return $next_page_url;
}

sub get_content {
    my ($url) = @_;
    my $ua = LWP::UserAgent->new();
    my $request  = HTTP::Request->new( GET => $url );
    my $response = $ua->request($request);
    my $content  = $response->decoded_content() if $response->is_success();
    return $content;
}

sub grep_content {
    my ($content)  = @_;
    my $match_head = q(<img class="fl dailyEimg" alt="词霸每日一句);
    my $match_tail = q(" src="attachment);
    my @matches;
    while ( $content =~ /$match_head(.*?)$match_tail/ ) {
        push @matches, $1 . "\n";
        $content =~ s/$match_head(.*?)$match_tail//;
    }
    return @matches;
}

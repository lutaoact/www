#!/usr/bin/perl
use warnings; use strict;
$^I = ".bak";
while(<>)
{
    s/ $//g;#delete 1 space from the end of every line
    print;
}

#!/usr/bin/perl -T
use warnings; use strict;
$ENV{'PATH'} = '/bin:/usr/bin:';
while(<>)
{
    if (/(ls)/)
    {
        my $command = $&;
        print $command, "\n";
        system($command);
    }
}

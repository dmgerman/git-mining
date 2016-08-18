#!/usr/bin/perl

my $strict;
my $cid;
while (<>) {
    chomp;
    s/;/<SEMICOLON>/g;
    if (/^commit ([0-9a-f]{40}) *(.*)$/) {
        $cid = $1;
        print "$1;$2\n";
    } elsif  (/^([0-9a-f]{40}) *(.*)$/) {
        $cid = $1;
        print "$1;$2\n";
    } else {
        if (/^(\D+):\s+(.*)$/) {
           $_ = "$1;$2";
        }
        print "$cid;$_\n";
    }
}

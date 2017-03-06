#!/usr/bin/perl

my $strict;
my $cid;
while (<>) {
    chomp;
    s/;/<SEMICOLON>/g;
    
    if (/^commit ([0-9a-f]{40}) *(.*)$/) { 
        # match commit id
        $cid = $1; 
        print "$1;$2\n";
    } elsif (/^([0-9a-f]{40}) *(.*)$/) {
        # --abbrev does not include commit
        $cid = $1; 
        print "$1;$2\n";
    } else {
        if (/^(\S+):\s+(.*)$/) {
           # if it has a non-space sequence followed by :
           # then it is a header field. split
            print "$cid;$1;$2\n";
        } else {
            print "$cid;;$_\n";
        }
    }
}

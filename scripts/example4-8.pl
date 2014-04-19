#!/usr/bin/perl -w
# Example 4-8   Demonstration of "scalar context" and "list context"

@bases = ( 'A', 'C', 'G', 'T' );

print "@bases\n";

$a = @bases;

print $a, "\n";

($a) = @bases;

print $a, "\n";

exit;

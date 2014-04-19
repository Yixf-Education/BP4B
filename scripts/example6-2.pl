#!/usr/bin/perl -w
# Example 6-2   Illustrating the pitfalls of not using my variables

$dna = 'AAAAA';

$result = A_to_T($dna);

print "I changed all the A's in $dna to T's and got $result\n\n";

exit;

################################################################################
# Subroutines
################################################################################
sub A_to_T {
    my ($input) = @_;

    $dna = $input;

    $dna =~ s/A/T/g;

    return $dna;
}

#!/usr/bin/perl -w
# Example 6-1   A program with a subroutine to append ACGT to DNA

# The original DNA
$dna = 'CGACGTCTTCTCAGGCGA';

# The call to the subroutine "addACGT".
# The argument being passed in is $dna; the result is saved in $longer_dna
$longer_dna = addACGT($dna);

print "I added ACGT to $dna and got $longer_dna\n\n";

exit;

################################################################################
# Subroutines for Example 6-1
################################################################################

# Here is the definition for subroutine "addACGT"

sub addACGT {
    my ($dna) = @_;

    $dna .= 'ACGT';
    return $dna;
}

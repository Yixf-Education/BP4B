#!/usr/bin/perl -w
# Example 7-2   Mutate DNA
#  using a random number generator to randomly select bases to mutate

use strict;
use warnings;

# Declare the variables

# The DNA is chosen to make it easy to see mutations:
my $DNA = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA';

# $i is a common name for a counter variable, short for "integer"
my $i;

my $mutant;

# Seed the random number generator.
# time|$$ combines the current time with the current process id
srand( time | $$ );

# Let's test it, shall we?
$mutant = mutate($DNA);

print "\nMutate DNA\n\n";

print "\nHere is the original DNA:\n\n";
print "$DNA\n";

print "\nHere is the mutant DNA:\n\n";
print "$mutant\n";

# Let's put it in a loop and watch that bad boy accumulate mutations:
print "\nHere are 10 more successive mutations:\n\n";

for ( $i = 0 ; $i < 10 ; ++$i ) {
    $mutant = mutate($mutant);
    print "$mutant\n";
}

exit;
################################################################################
# Subroutines for Example 7-2
################################################################################

#  Notice, now that we have a fair number of subroutines, we
#  list them alphabetically

# A subroutine to perform a mutation in a string of DNA
#
# WARNING: make sure you call srand to seed the
#  random number generator before you call this function.

sub mutate {

    my ($dna) = @_;

    my (@nucleotides) = ( 'A', 'C', 'G', 'T' );

    # Pick a random position in the DNA
    my ($position) = randomposition($dna);

    # Pick a random nucleotide
    my ($newbase) = randomnucleotide(@nucleotides);

    # Insert the random nucleotide into the random position in the DNA
    # The substr arguments mean the following:
    #  In the string $dna at position $position change 1 character to
    #  the string in $newbase
    substr( $dna, $position, 1, $newbase );

    return $dna;
}

# A subroutine to randomly select an element from an array
#
# WARNING: make sure you call srand to seed the
#  random number generator before you call this function.

sub randomelement {

    my (@array) = @_;

    return $array[ rand @array ];
}

# randomnucleotide
#
# A subroutine to select at random one of the four nucleotides
#
# WARNING: make sure you call srand to seed the
#  random number generator before you call this function.

sub randomnucleotide {

    my (@nucleotides) = ( 'A', 'C', 'G', 'T' );

    # scalar returns the size of an array.
    # The elements of the array are numbered 0 to size-1
    return randomelement(@nucleotides);
}

# randomposition
#
# A subroutine to randomly select a position in a string.
#
# WARNING: make sure you call srand to seed the
#  random number generator before you call this function.

sub randomposition {

    my ($string) = @_;

    # Notice the "nested" arguments:
    #
    # $string is the argument to length
    # length($string) is the argument to rand
    # rand(length($string))) is the argument to int
    # int(rand(length($string))) is the argument to return
    # But we write it without parentheses, as permitted.
    #
    # rand returns a decimal number between 0 and its argument.
    # int returns the integer portion of a decimal number.
    #
    # The whole expression returns a random number between 0 and length-1,
    #  which is how the positions in a string are numbered in Perl.
    #

    return int rand length $string;
}

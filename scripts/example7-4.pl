#!/usr/bin/perl -w
# Example 7-4   Calculate the average percentage of positions that are the same
# between two random DNA sequences, in a set of 10 sequences.

use strict;
use warnings;

# Declare and initialize the variables
my $percent;
my @percentages;
my $result;

# An array, initialized to the empty list, to store the DNA in
my @random_DNA = ();

# Seed the random number generator.
# time|$$ combines the current time with the current process id
srand( time | $$ );

#  Generate the data set of 10 DNA sequences.
@random_DNA = make_random_DNA_set( 10, 10, 10 );

# Iterate through all pairs of sequences
for ( my $k = 0 ; $k < scalar @random_DNA - 1 ; ++$k ) {
    for ( my $i = ( $k + 1 ) ; $i < scalar @random_DNA ; ++$i ) {

        # Calculate and save the matching percentage
        $percent = matching_percentage( $random_DNA[$k], $random_DNA[$i] );
        push( @percentages, $percent );
    }
}

# Finally, the average result:
$result = 0;

foreach $percent (@percentages) {
    $result += $percent;
}

$result = $result / scalar(@percentages);

#Turn result into a true percentage
$result = int( $result * 100 );
print "In this run of the experiment, the average percentage of \n";
print "matching positions is $result%\n\n";

exit;

################################################################################
# Subroutines
################################################################################

# matching_percentage
#
# Subroutine to calculate the percentage of identical bases in two
# equal length DNA sequences

sub matching_percentage {

    my ( $string1, $string2 ) = @_;

    # we assume that the strings have the same length
    my ($length) = length($string1);
    my ($position);
    my ($count) = 0;

    for ( $position = 0 ; $position < $length ; ++$position ) {
        if (
            substr( $string1, $position, 1 ) eq substr( $string2, $position, 1 )
          )
        {
            ++$count;
        }
    }

    return $count / $length;
}

# make_random_DNA_set
#
# Subroutine to make a set of random DNA
#
#   Accept parameters setting the maximum and minimum length of
#     each string of DNA, and the number of DNA strings to make
#
# WARNING: make sure you call srand to seed the
#  random number generator before you call this function.

sub make_random_DNA_set {

    # Collect arguments, declare variables
    my ( $minimum_length, $maximum_length, $size_of_set ) = @_;

    # length of each DNA fragment
    my $length;

    # DNA fragment
    my $dna;

    # set of DNA fragments
    my @set;

    # Create set of random DNA
    for ( my $i = 0 ; $i < $size_of_set ; ++$i ) {

        # find a random length between min and max
        $length = randomlength( $minimum_length, $maximum_length );

        # make a random DNA fragment
        $dna = make_random_DNA($length);

        # add $dna fragment to @set
        push( @set, $dna );
    }

    return @set;
}

# randomlength
#
# A subroutine that will pick a random number from
# $minlength to $maxlength, inclusive.
#
# WARNING: make sure you call srand to seed the
#  random number generator before you call this function.

sub randomlength {

    # Collect arguments, declare variables
    my ( $minlength, $maxlength ) = @_;

    # Calculate and return a random number within the
    #  desired interval.
    # Notice how we need to add one to make the endpoints inclusive,
    #  and how we first subtract, then add back, $minlength to
    #  get the random number in the correct interval.
    return ( int( rand( $maxlength - $minlength + 1 ) ) + $minlength );
}

# make_random_DNA
#
# Make a string of random DNA of specified length.
#
# WARNING: make sure you call srand to seed the
#  random number generator before you call this function.

sub make_random_DNA {

    # Collect arguments, declare variables
    my ($length) = @_;

    my $dna;

    for ( my $i = 0 ; $i < $length ; ++$i ) {
        $dna .= randomnucleotide();
    }

    return $dna;
}

# randomnucleotide
#
# Select at random one of the four nucleotides
#
# WARNING: make sure you call srand to seed the
#  random number generator before you call this function.

sub randomnucleotide {

    my (@nucleotides) = ( 'A', 'C', 'G', 'T' );

    # scalar returns the size of an array.
    # The elements of the array are numbered 0 to size-1
    return randomelement(@nucleotides);
}

# randomelement
#
# randomly select an element from an array
#
# WARNING: make sure you call srand to seed the
#  random number generator before you call this function.

sub randomelement {

    my (@array) = @_;

    return $array[ rand @array ];
}

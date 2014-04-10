#!/usr/bin/perl -w
# Example 7-3   Generate random DNA
#  using a random number generator to randomly select bases

use strict;
use warnings;

# Declare and initialize the variables
my $size_of_set = 12;
my $maximum_length = 30;
my $minimum_length = 15;

# An array, initialized to the empty list, to store the DNA in
my @random_DNA = (  );

# Seed the random number generator.
# time|$$ combines the current time with the current process id
srand(time|$$);

# And here's the subroutine call to do the real work
@random_DNA = make_random_DNA_set( $minimum_length, $maximum_length, $size_of_set );

# Print the results, one per line
print "Here is an array of $size_of_set randomly generated DNA sequences\n";
print "  with lengths between $minimum_length and $maximum_length:\n\n";

foreach my $dna (@random_DNA) {

    print "$dna\n";
}

print "\n";

exit;

################################################################################
# Subroutines
################################################################################

# make_random_DNA_set
#
# Make a set of random DNA
#
#   Accept parameters setting the maximum and minimum length of
#     each string of DNA, and the number of DNA strings to make
#
# WARNING: make sure you call srand to seed the
#  random number generator before you call this function.

sub make_random_DNA_set {

    # Collect arguments, declare variables
    my($minimum_length, $maximum_length, $size_of_set) = @_;

    # length of each DNA fragment
    my $length;
    
    # DNA fragment
    my $dna;

    # set of DNA fragments
    my @set;

    # Create set of random DNA
    for (my $i = 0; $i < $size_of_set ; ++$i) {

        # find a random length between min and max
        $length = randomlength ($minimum_length, $maximum_length);

        # make a random DNA fragment
        $dna = make_random_DNA ( $length );

        # add $dna fragment to @set
        push( @set, $dna );
    }

    return @set;
}

# Notice that we've just discovered a new subroutine that's
# needed: randomlength, which will return a random
# number between (or including) the min and max values.
# Let's write that first, then do make_random_DNA

# randomlength
#
# A subroutine that will pick a random number from
# $minlength to $maxlength, inclusive.
#
# WARNING: make sure you call srand to seed the
#  random number generator before you call this function.

sub randomlength {

    # Collect arguments, declare variables
    my($minlength, $maxlength) = @_;

    # Calculate and return a random number within the
    #  desired interval.
    # Notice how we need to add one to make the endpoints inclusive,
    #  and how we first subtract, then add back, $minlength to
    #  get the random number in the correct interval.
    return ( int(rand($maxlength - $minlength + 1)) + $minlength );
}

# make_random_DNA
#
# Make a string of random DNA of specified length.
#
# WARNING: make sure you call srand to seed the
#  random number generator before you call this function.

sub make_random_DNA {

    # Collect arguments, declare variables
    my($length) = @_;

    my $dna;

    for (my $i=0 ; $i < $length ; ++$i) {

        $dna .= randomnucleotide(  );
    }

    return $dna;
}

# We also need to include the previous subroutine
# randomnucleotide.
# Here it is again for completeness.

# randomnucleotide
#
# Select at random one of the four nucleotides
#
# WARNING: make sure you call srand to seed the
#  random number generator before you call this function.

sub randomnucleotide {

    my(@nucleotides) = ('A', 'C', 'G', 'T');

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

    my(@array) = @_;

    return $array[rand @array];
}

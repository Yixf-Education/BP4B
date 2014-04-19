#!/usr/bin/perl
# Example 6-4   A program with a bug or two
#
# An optional argument, for where to start printing the sequence,
#  is a two-base subsequence.
#
# Print everything from the subsequence ( or TA if no subsequence
# is given as an argument) to the end of the DNA.

# declare and initialize variables
my $dna = 'CGACGTCTTCTAAGGCGA';
my @dna;
my $receivingcommittment;
my $previousbase = ''; 

my$subsequence = '';

if (@ARGV) {
    my$subsequence = $ARGV[0];
}else{
    $subsequence = 'TA';
}

my $base1 = substr($subsequence, 0, 1);
my $base2 = substr($subsequence, 1, 1);

# explode DNA
@dna = split ( '', $dna );

######### Pseudocode of the following loop:
#
# If you've received a committment, print the base and continue.  Otherwise:
#
# If the previous base was $base1, and this base is $base2, print them.
#   You have now received a committment to print the rest of the string.
#
# At each loop, save the previous base.

foreach (@dna) {
    if ($receivingcommittment) {
        print;
        next;
    } elsif ($previousbase eq $base1) {
        if ( /$base2/ ) {
            print $base1, $base2; 
            $recievingcommitment = 1;
        }
    }
    $previousbase = $_;
}

print "\n";

exit;

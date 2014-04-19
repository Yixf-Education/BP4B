#!/usr/bin/perl -w
# Example 5-4   Determining frequency of nucleotides

# Get the name of the file with the DNA sequence data
print "Please type the filename of the DNA sequence data: ";

$dna_filename = <STDIN>;

# Remove the newline from the DNA filename
chomp $dna_filename;

# open the file, or exit
unless ( open( DNAFILE, $dna_filename ) ) {

    print "Cannot open file \"$dna_filename\"\n\n";
    exit;
}

# Read the DNA sequence data from the file, and store it
# into the array variable @DNA
@DNA = <DNAFILE>;

# Close the file
close DNAFILE;

# From the lines of the DNA file,
# put the DNA sequence data into a single string.
$DNA = join( '', @DNA );

# Remove whitespace
$DNA =~ s/\s//g;

# Now explode the DNA into an array where each letter of the
# original string is now an element in the array.
# This will make it easy to look at each position.
# Notice that we're reusing the variable @DNA for this purpose.
@DNA = split( '', $DNA );

# Initialize the counts.
# Notice that we can use scalar variables to hold numbers.
$count_of_A = 0;
$count_of_C = 0;
$count_of_G = 0;
$count_of_T = 0;
$errors     = 0;

# In a loop, look at each base in turn, determine which of the
# four types of nucleotides it is, and increment the
# appropriate count.
foreach $base (@DNA) {

    if ( $base eq 'A' ) {
        ++$count_of_A;
    }
    elsif ( $base eq 'C' ) {
        ++$count_of_C;
    }
    elsif ( $base eq 'G' ) {
        ++$count_of_G;
    }
    elsif ( $base eq 'T' ) {
        ++$count_of_T;
    }
    else {
        print "!!!!!!!! Error - I don\'t recognize this base: $base\n";
        ++$errors;
    }
}

# print the results
print "A = $count_of_A\n";
print "C = $count_of_C\n";
print "G = $count_of_G\n";
print "T = $count_of_T\n";
print "errors = $errors\n";

# exit the program
exit;

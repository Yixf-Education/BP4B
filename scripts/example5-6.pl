#!/usr/bin/perl -w
# Example 5-6   Determining frequency of nucleotides, take 2

# Get the DNA sequence data
print "Please type the filename of the DNA sequence data: ";

$dna_filename = <STDIN>;

chomp $dna_filename;

# Does the file exist?
unless ( -e $dna_filename ) {

    print "File \"$dna_filename\" doesn\'t seem to exist!!\n";
    exit;
}

# Can we open the file?
unless ( open( DNAFILE, $dna_filename ) ) {

    print "Cannot open file \"$dna_filename\"\n\n";
    exit;
}

@DNA = <DNAFILE>;

close DNAFILE;

$DNA = join( '', @DNA );

# Remove whitespace
$DNA =~ s/\s//g;

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
for ( $position = 0 ; $position < length $DNA ; ++$position ) {

    $base = substr( $DNA, $position, 1 );

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

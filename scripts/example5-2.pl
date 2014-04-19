#!/usr/bin/perl -w
# Example 5-2   Reading protein sequence data from a file, take 4

# The filename of the file containing the protein sequence data
$proteinfilename = 'NM_021964fragment.pep';

# First we have to "open" the file, and in case the
# open fails, print an error message and exit the program.
unless ( open( PROTEINFILE, $proteinfilename ) ) {

    print "Could not open file $proteinfilename!\n";
    exit;
}

# Read the protein sequence data from the file in a "while" loop,
# printing each line as it is read.
while ( $protein = <PROTEINFILE> ) {

    print "  ######  Here is the next line of the file:\n";

    print $protein;
}

# Close the file.
close PROTEINFILE;

exit;

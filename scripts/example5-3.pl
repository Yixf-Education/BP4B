#!/usr/bin/perl -w
# Example 5-3   Searching for motifs

# Ask the user for the filename of the file containing
# the protein sequence data, and collect it from the keyboard
print "Please type the filename of the protein sequence data: ";

$proteinfilename = <STDIN>;

# Remove the newline from the protein filename
chomp $proteinfilename;

# open the file, or exit
unless ( open( PROTEINFILE, $proteinfilename ) ) {

    print "Cannot open file \"$proteinfilename\"\n\n";
    exit;
}

# Read the protein sequence data from the file, and store it
# into the array variable @protein
@protein = <PROTEINFILE>;

# Close the file - we've read all the data into @protein now.
close PROTEINFILE;

# Put the protein sequence data into a single string, as it's easier
# to search for a motif in a string than in an array of
# lines (what if the motif occurs over a line break?)
$protein = join( '', @protein );

# Remove whitespace
$protein =~ s/\s//g;

# In a loop, ask the user for a motif, search for the motif,
# and report if it was found.
# Exit if no motif is entered.
do {
    print "Enter a motif to search for: ";

    $motif = <STDIN>;

    # Remove the newline at the end of $motif

    chomp $motif;

    # Look for the motif

    if ( $protein =~ /$motif/ ) {

        print "I found it!\n\n";

    }
    else {

        print "I couldn\'t find it.\n\n";
    }

    # exit on an empty user input
} until ( $motif =~ /^\s*$/ );

# exit the program
exit;

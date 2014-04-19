#!/usr/bin/perl -w
# Example 4-7   Reading protein sequence data from a file, take 3

# The filename of the file containing the protein sequence data
$proteinfilename = 'NM_021964fragment.pep';

# First we have to "open" the file
open( PROTEINFILE, $proteinfilename );

# Read the protein sequence data from the file, and store it
# into the array variable @protein
@protein = <PROTEINFILE>;

# Print the protein onto the screen
print @protein;

# Close the file.
close PROTEINFILE;

exit;

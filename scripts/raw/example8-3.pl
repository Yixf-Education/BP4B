#!/usr/bin/perl -w
# Example 8-3   Read a fasta file and extract the DNA sequence data
# Translate it to protein and print it out in 25-character-long lines

use strict;
use warnings;
use BeginPerlBioinfo;     # see Chapter 6 about this module

# Initialize variables
my @file_data = (  );
my $dna = '';
my $protein = '';

# Read in the contents of the file "sample.dna"
@file_data = get_file_data("sample.dna");

# Extract the sequence data from the contents of the file "sample.dna"
$dna = extract_sequence_from_fasta_data(@file_data);

# Translate the DNA to protein
$protein = dna2peptide($dna);

# Print the sequence in lines 25 characters long
print_sequence($protein, 25);

exit;

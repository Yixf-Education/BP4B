#!/usr/bin/perl -w
# Example 8-2   Read a fasta file and extract the sequence data

use strict;
use warnings;
use BeginPerlBioinfo;     # see Chapter 6 about this module

# Declare and initialize variables
my @file_data = (  );
my $dna = '';

# Read in the contents of the file "sample.dna"
@file_data = get_file_data("sample.dna");

# Extract the sequence data from the contents of the file "sample.dna"
$dna = extract_sequence_from_fasta_data(@file_data);

# Print the sequence in lines 25 characters long
print_sequence($dna, 25);

exit;

#!/usr/bin/perl
# Example 10-2   Extract the annotation and sequence sections from the first
#   record of a GenBank library

use strict;
use warnings;
use BeginPerlBioinfo;    # see Chapter 6 about this module

# Declare and initialize variables
my $annotation           = '';
my $dna                  = '';
my $record               = '';
my $filename             = 'record.gb';
my $save_input_separator = $/;

# Open GenBank library file
unless ( open( GBFILE, $filename ) ) {
    print "Cannot open GenBank file \"$filename\"\n\n";
    exit;
}

# Set input separator to "//\n" and read in a record to a scalar
$/ = "//\n";

$record = <GBFILE>;

# reset input separator
$/ = $save_input_separator;

# Now separate the annotation from the sequence data
( $annotation, $dna ) = ( $record =~ /^(LOCUS.*ORIGIN\s*\n)(.*)\/\/\n/s );

# Print the two pieces, which should give us the same as the
#  original GenBank file, minus the // at the end
print $annotation, $dna;

exit;

#!/usr/bin/perl -w
# Example 10-3   Parsing GenBank annotations using arrays

use strict;
use warnings;
use BeginPerlBioinfo;    # see Chapter 6 about this module

# Declare and initialize variables
my @genbank   = ();
my $locus     = '';
my $accession = '';
my $organism  = '';

# Get GenBank file data
@genbank = get_file_data('record.gb');

# Let's start with something simple.  Let's get some of the identifying
# information, let's say the locus and accession number (here the same
# thing) and the definition and the organism.

for my $line (@genbank) {
    if ( $line =~ /^LOCUS/ ) {
        $line =~ s/^LOCUS\s*//;
        $locus = $line;
    }
    elsif ( $line =~ /^ACCESSION/ ) {
        $line =~ s/^ACCESSION\s*//;
        $accession = $line;
    }
    elsif ( $line =~ /^  ORGANISM/ ) {
        $line =~ s/^\s*ORGANISM\s*//;
        $organism = $line;
    }
}

print "*** LOCUS ***\n";
print $locus;
print "*** ACCESSION ***\n";
print $accession;
print "*** ORGANISM ***\n";
print $organism;

exit;

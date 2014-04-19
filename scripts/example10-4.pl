#!/usr/bin/perl -w
# Example 10-4   Parsing GenBank annotations using arrays, take 2

use strict;
use warnings;
use BeginPerlBioinfo;    # see Chapter 6 about this module

# Declare and initialize variables
my @genbank    = ();
my $locus      = '';
my $accession  = '';
my $organism   = '';
my $definition = '';
my $flag       = 0;

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
    elsif ( $line =~ /^DEFINITION/ ) {
        $line =~ s/^DEFINITION\s*//;
        $definition = $line;
        $flag       = 1;
    }
    elsif ( $line =~ /^ACCESSION/ ) {
        $line =~ s/^ACCESSION\s*//;
        $accession = $line;
        $flag      = 0;
    }
    elsif ($flag) {
        chomp($definition);
        $definition .= $line;
    }
    elsif ( $line =~ /^  ORGANISM/ ) {
        $line =~ s/^\s*ORGANISM\s*//;
        $organism = $line;
    }
}

print "*** LOCUS ***\n";
print $locus;
print "*** DEFINITION ***\n";
print $definition;
print "*** ACCESSION ***\n";
print $accession;
print "*** ORGANISM ***\n";
print $organism;

exit;

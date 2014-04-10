#!/usr/bin/perl -w
# Example 9-3   Make restriction map from user queries on names of restriction enzymes

use strict;
use warnings;
use BeginPerlBioinfo;     # see Chapter 6 about this module

# Declare and initialize variables
my %rebase_hash = (  );
my @file_data = (  );
my $query = '';
my $dna = '';
my $recognition_site = '';
my $regexp = '';
my @locations = (  );

# Read in the file "sample.dna"
@file_data = get_file_data("sample.dna");

# Extract the DNA sequence data from the contents of the file "sample.dna"
$dna = extract_sequence_from_fasta_data(@file_data);

# Get the REBASE data into a hash, from file "bionet"
%rebase_hash = parseREBASE('bionet');

# Prompt user for restriction enzyme names, create restriction map
do {
    print "Search for what restriction site for (or quit)?: ";
    
    $query = <STDIN>;

    chomp $query;

    # Exit if empty query
    if ($query =~ /^\s*$/ ) {

        exit;
    }

    # Perform the search in the DNA sequence
    if ( exists $rebase_hash{$query} ) {

        ($recognition_site, $regexp) = split ( " ", $rebase_hash{$query});

        # Create the restriction map
        @locations = match_positions($regexp, $dna);

        # Report the restriction map to the user
        if (@locations) {
            print "Searching for $query $recognition_site $regexp\n";
            print "A restriction site for $query at locations:\n";
            print join(" ", @locations), "\n";
        } else {
            print "A restriction enzyme $query is not in the DNA:\n";
        }
    }
    print "\n";
} until ( $query =~ /quit/ );

exit;

################################################################################
#
# Subroutine
#
# Find locations of a match of a regular expression in a string
#
# 
# return an array of positions where the regular expression
#  appears in the string
#

sub match_positions {

    my($regexp, $sequence) = @_;

    use strict;

    use BeginPerlBioinfo;     # see Chapter 6 about this module

    #
    # Declare variables
    #

    my @positions = (  );

    #
    # Determine positions of regular expression matches
    #
    
    while ( $sequence =~ /$regexp/ig ) {

        push ( @positions, pos($sequence) - length($&) + 1);
    }

    return @positions;
}

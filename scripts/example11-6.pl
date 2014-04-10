#!/usr/bin/perl
# Example 11-6   Extract atomic coordinates from PDB file

use strict;
use warnings;
use BeginPerlBioinfo;     # see Chapter 6 about this module

# Read in PDB file
my @file = get_file_data('pdb/c1/pdb1c1f.ent');

# Parse the record types of the PDB file
my %recordtypes = parsePDBrecordtypes(@file);

# Extract the atoms of all chains in the protein
my %atoms = parseATOM ( $recordtypes{'ATOM'} );

# Print out a couple of the atoms
print $atoms{'1'}, "\n";
print $atoms{'1078'}, "\n";

exit;

################################################################################
# Subroutines of Example 11-6
################################################################################

# parseATOM
#
# -extract x, y, and z coordinates, serial number and element symbol
#     from PDB ATOM record type
#      Return a hash with key=serial number, value=coordinates in a string

sub parseATOM {

    my($atomrecord) = @_;

    use strict;
    use warnings;
    my %results = (  );

    # Turn the scalar into an array of ATOM lines
    my(@atomrecord) = split(/\n/, $atomrecord);

    foreach my $record (@atomrecord) {
       my $number  = substr($record,  6, 5);  # columns 7-11
       my $x       = substr($record, 30, 8);  # columns 31-38
       my $y       = substr($record, 38, 8);  # columns 39-46
       my $z       = substr($record, 46, 8);  # columns 47-54
       my $element = substr($record, 76, 2);  # columns 77-78

        # $number and $element may have leading spaces: strip them
        $number =~ s/^\s*//;
        $element =~ s/^\s*//;

        # Store information in hash
        $results{$number} = "$x $y $z $element";
    }

    # Return the hash
    return %results;
}

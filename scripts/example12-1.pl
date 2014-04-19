#!/usr/bin/perl
# Example 12-1   Extract annotation and alignments from BLAST output file

use strict;
use warnings;
use BeginPerlBioinfo;    # see Chapter 6 about this module

# declare and initialize variables
my $beginning_annotation = '';
my $ending_annotation    = '';
my %alignments           = ();
my $filename             = 'blast.txt';

parse_blast( \$beginning_annotation, \$ending_annotation, \%alignments,
    $filename );

# Print the annotation, and then
#   print the DNA in new format just to check if we got it okay.
print $beginning_annotation;

foreach my $key ( keys %alignments ) {
    print "$key\nXXXXXXXXXXXX\n", $alignments{$key}, "\nXXXXXXXXXXX\n";
}

print $ending_annotation;

exit;

################################################################################
# Subroutines for Example 12-1
################################################################################

# parse_blast
#
# -parse beginning and ending annotation, and alignments,
#     from BLAST output file

sub parse_blast {

    my ( $beginning_annotation, $ending_annotation, $alignments, $filename ) =
      @_;

    # $beginning_annotation-reference to scalar
    # $ending_annotation   -reference to scalar
    # $alignments          -reference to hash
    # $filename            -scalar

    # declare and initialize variables
    my $blast_output_file = '';
    my $alignment_section = '';

    # Get the BLAST program output into an array from a file
    $blast_output_file = join( '', get_file_data($filename) );

    # Extract the beginning annotation, alignments, and ending annotation
    ( $$beginning_annotation, $alignment_section, $$ending_annotation ) =
      ( $blast_output_file =~ /(.*^ALIGNMENTS\n)(.*)(^  Database:.*)/ms );

    # Populate %alignments hash
    # key = ID of hit
    # value = alignment section
    %$alignments = parse_blast_alignment($alignment_section);
}

# parse_blast_alignment
#
# -parse the alignments from a BLAST output file,
#       return hash with
#       key = ID
#       value = text of alignment

sub parse_blast_alignment {

    my ($alignment_section) = @_;

    # declare and initialize variables
    my (%alignment_hash) = ();

    # loop through the scalar containing the BLAST alignments,
    # extracting the ID and the alignment and storing in a hash
    #
    # The regular expression matches a line beginning with >,
    # and containing the ID between the first pair of | characters;
    # followed by any number of lines that don't begin with >

    while ( $alignment_section =~ /^>.*\n(^(?!>).*\n)+/gm ) {
        my ($value) = $&;
        my ($key) = ( split( /\|/, $value ) )[1];
        $alignment_hash{$key} = $value;
    }

    return %alignment_hash;
}

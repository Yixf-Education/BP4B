#!/usr/bin/perl
# Example 12-2   Parse alignments from BLAST output file

use strict;
use warnings;
use BeginPerlBioinfo;    # see Chapter 6 about this module

# declare and initialize variables
my $beginning_annotation = '';
my $ending_annotation    = '';
my %alignments           = ();
my $alignment            = '';
my $filename             = 'blast.txt';
my @HSPs                 = ();
my ( $expect, $query, $query_range, $subject, $subject_range ) =
  ( '', '', '', '', '' );

parse_blast( \$beginning_annotation, \$ending_annotation, \%alignments,
    $filename );

$alignment = $alignments{'AK017941.1'};

@HSPs = parse_blast_alignment_HSP($alignment);

( $expect, $query, $query_range, $subject, $subject_range ) =
  extract_HSP_information( $HSPs[1] );

# Print the results
print "\n-> Expect value:   $expect\n";
print "\n-> Query string:   $query\n";
print "\n-> Query range:    $query_range\n";
print "\n-> Subject String: $subject\n";
print "\n-> Subject range:  $subject_range\n";

exit;

################################################################################
# Subroutines for Example 12-2
################################################################################

# parse_blast_alignment_HSP
#
# -parse beginning annotation, and HSPs,
#     from BLAST alignment
#     Return an array with first element set to the beginning annotation,
#    and each successive element set to an HSP

sub parse_blast_alignment_HSP {

    my ($alignment) = @_;

    # declare and initialize variables
    my $beginning_annotation = '';
    my $HSP_section          = '';
    my @HSPs                 = ();

    # Extract the beginning annotation and HSPs
    ( $beginning_annotation, $HSP_section ) =
      ( $alignment =~ /(.*?)(^ Score =.*)/ms );

    # Store the $beginning_annotation as the first entry in @HSPs
    push( @HSPs, $beginning_annotation );

    # Parse the HSPs, store each HSP as an element in @HSPs
    while ( $HSP_section =~ /(^ Score =.*\n)(^(?! Score =).*\n)+/gm ) {
        push( @HSPs, $& );
    }

    # Return an array with first element = the beginning annotation,
    # and each successive element = an HSP
    return (@HSPs);
}

# extract_HSP_information
#
# -parse a HSP from a BLAST output alignment section
#        - return array with elements:
#    Expect value
#    Query string
#    Query range
#    Subject string
#    Subject range

sub extract_HSP_information {

    my ($HSP) = @_;

    # declare and initialize variables
    my ($expect)        = '';
    my ($query)         = '';
    my ($query_range)   = '';
    my ($subject)       = '';
    my ($subject_range) = '';

    ($expect) = ( $HSP =~ /Expect = (\S+)/ );

    $query = join( '', ( $HSP =~ /^Query(.*)\n/gm ) );

    $subject = join( '', ( $HSP =~ /^Sbjct(.*)\n/gm ) );

    $query_range = join( '..', ( $query =~ /(\d+).*\D(\d+)/s ) );

    $subject_range = join( '..', ( $subject =~ /(\d+).*\D(\d+)/s ) );

    $query =~ s/[^acgt]//g;

    $subject =~ s/[^acgt]//g;

    return ( $expect, $query, $query_range, $subject, $subject_range );
}

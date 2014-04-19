#!/usr/bin/perl
# Example 10-5 - test program of GenBank library subroutines)

use strict;
use warnings;
# Don't use BeginPerlBioinfo
# Since all subroutines defined in this file
# use BeginPerlBioinfo;     # see Chapter 6 about this module

# Declare and initialize variables
my $fh; # variable to store filehandle
my $record;
my $dna;
my $annotation;
my $offset;
my $library = 'library.gb';

# Perform some standard subroutines for test
$fh = open_file($library);

$offset = tell($fh);

while( $record = get_next_record($fh) ) {

    ($annotation, $dna) = get_annotation_and_dna($record);

    if( search_sequence($dna, 'AAA[CG].')) {
        print "Sequence found in record at offset $offset\n";
    }
    if( search_annotation($annotation, 'homo sapiens')) {
        print "Annotation found in record at offset $offset\n";
    }

    $offset = tell($fh);
}

exit;

################################################################################
# Subroutines
################################################################################

# open_file
#
#   - given filename, set filehandle

sub open_file {

    my($filename) = @_;
    my $fh;

    unless(open($fh, $filename)) {
        print "Cannot open file $filename\n";
        exit;
    }
    return $fh;
}

# get_next_record
#
#   - given GenBank record, get annotation and DNA

sub get_next_record {

    my($fh) = @_;

    my($offset);
    my($record) = '';
    my($save_input_separator) = $/;

    $/ = "//\n";

    $record = <$fh>;

    $/ = $save_input_separator;

    return $record;
}

# get_annotation_and_dna
#
#   - given filehandle to open GenBank library file, get next record

sub get_annotation_and_dna {

    my($record) = @_;

    my($annotation) = '';
    my($dna) = '';

    # Now separate the annotation from the sequence data
    ($annotation, $dna) = ($record =~ /^(LOCUS.*ORIGIN\s*\n)(.*)\/\/\n/s);

    # clean the sequence of any whitespace or / characters 
    #  (the / has to be written \/ in the character class, because
    #   / is a metacharacter, so it must be "escaped" with \)
    $dna =~ s/[\s\/]//g;

    return($annotation, $dna)
}

# search_sequence
#
#   - search sequence with regular expression

sub search_sequence {

    my($sequence, $regularexpression) = @_;

    my(@locations) = (  );

    while( $sequence =~ /$regularexpression/ig ) {
        push( @locations, pos );
    }

    return (@locations);
}

# search_annotation
#
#   - search annotation with regular expression

sub search_annotation {

    my($annotation, $regularexpression) = @_;

    my(@locations) = (  );

    # note the /s modifier-. matches any character including newline
    while( $annotation =~ /$regularexpression/isg ) {
        push( @locations, pos );
    }

    return (@locations);
}

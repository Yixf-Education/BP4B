#!/usr/bin/perl
# Example 10-6 - test program for parse_annotation subroutine

use strict;
use warnings;
use BeginPerlBioinfo;    # see Chapter 6 about this module

# Declare and initialize variables
my $fh;
my $record;
my $dna;
my $annotation;
my %fields;
my $library = 'library.gb';

# Open library and read a record
$fh = open_file($library);

$record = get_next_record($fh);

# Parse the sequence and annotation
( $annotation, $dna ) = get_annotation_and_dna($record);

# Extract the fields of the annotation
%fields = parse_annotation($annotation);

# Print the fields
foreach my $key ( keys %fields ) {
    print "******** $key *********\n";
    print $fields{$key};
}

exit;

################################################################################
# Subroutine
################################################################################

# parse_annotation
#
#  given a GenBank annotation, returns a hash  with
#   keys: the field names
#   values: the fields

sub parse_annotation {

    my ($annotation) = @_;
    my (%results)    = ();

    while ( $annotation =~ /^[A-Z].*\n(^\s.*\n)*/gm ) {
        my $value = $&;
        ( my $key = $value ) =~ s/^([A-Z]+).*/$1/s;
        $results{$key} = $value;
    }

    return %results;
}

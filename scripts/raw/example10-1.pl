#!/usr/bin/perl
# Example 10-1   Extract annotation and sequence from GenBank file

use strict;
use warnings;
use BeginPerlBioinfo;     # see Chapter 6 about this module

# declare and initialize variables
my @annotation = (  );
my $sequence = '';
my $filename = 'record.gb';

parse1(\@annotation, \$sequence, $filename);

# Print the annotation, and then
#   print the DNA in new format just to check if we got it okay.
print @annotation;

print_sequence($sequence, 50);

exit;

################################################################################
# Subroutine
################################################################################

# parse1
#
# -parse annotation and sequence from GenBank record

sub parse1 {

    my($annotation, $dna, $filename) = @_;

    # $annotation-reference to array
    # $dna       -reference to scalar
    # $filename  -scalar
    
    # declare and initialize variables
    my $in_sequence = 0; 
    my @GenBankFile = (  );
    
    # Get the GenBank data into an array from a file
    @GenBankFile = get_file_data($filename);
    
    # Extract all the sequence lines
    foreach my $line (@GenBankFile) {

        if( $line =~ /^\/\/\n/ ) { # If $line is end-of-record line //\n,
            last; #break out of the foreach loop.
        } elsif( $in_sequence) { # If we know we're in a sequence,
            $$dna .= $line; # add the current line to $$dna.
        } elsif ( $line =~ /^ORIGIN/ ) { # If $line begins a sequence,
            $in_sequence = 1; # set the $in_sequence flag.
        } else{ # Otherwise
            push( @$annotation, $line); # add the current line to @annotation.
        }
    }
    
    # remove whitespace and line numbers from DNA sequence
    $$dna =~ s/[\s0-9]//g;
}

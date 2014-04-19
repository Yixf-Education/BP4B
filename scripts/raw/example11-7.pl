#!/usr/bin/perl
# Example 11-7   Call another program to perform secondary structure prediction

use strict;
use warnings;

# Call "stride" on a file, collect the report
my(@stride_output)  = call_stride('pdb/c1/pdb1c1f.ent');

# Parse the stride report into primary sequence, and secondary
#  structure prediction
my($sequence, $structure)  = parse_stride(@stride_output);

# Print out the beginnings of the sequence and the secondary structure
print substr($sequence, 0, 80), "\n";
print substr($structure, 0, 80), "\n";

exit;

################################################################################
# Subroutine for Example 11-7
################################################################################

# call_stride
#
# -given a PDB filename, return the output from the "stride"
#     secondary structure prediction program

sub call_stride {

    use strict;
    use warnings;

    my($filename) = @_;

    # The stride program options
    my($stride) = '/usr/local/bin/stride';
    my($options) = '';
    my(@results) = (  );

    # Check for presence of PDB file
    unless ( -e $filename ) {
        print "File \"$filename\" doesn\'t seem to exist!\n";
        exit;
    }

    # Start up the program, capture and return the output
    @results = `$stride $options $filename`;

    return @results;
}

# parse_stride
#
#-given stride output, extract the primary sequence and the
#    secondary structure prediction, returning them in a
#    two-element array.

sub parse_stride {

    use strict;
    use warnings;

    my(@stridereport) = @_;
    my($seq) = '';
    my($str) = '';
    my $length;

    # Extract the lines of interest
    my(@seq) = grep(/^SEQ /, @stridereport);

    my(@str) = grep(/^STR /, @stridereport);

    # Process those lines to discard all but the sequence
    #  or structure information
    for (@seq) { $_ = substr($_, 10, 50) }
    for (@str) { $_ = substr($_, 10, 50) }

    # Return the information as an array of two strings
    $seq = join('', @seq);
    $str = join('', @str);

    # Delete unwanted spaces from the ends of the strings.
    # ($seq has no spaces that are wanted, but $str may)
    $seq =~ s/(\s+)$//;

    $length = length($1);

    $str =~ s/\s{$length}$//;

    return( ($seq, $str) );
}

#!/usr/bin/perl
# Example 12-4   Create fasta format  DNA output with "format" function

use strict;
use warnings;

# Declare variables
my $id          = 'A0000';
my $description = 'Highly weird DNA.  This DNA is so unlikely!';
my $DNA = 'AAAAAACCCCCCCCCCCCCCGGGGGGGGGGGGGGGGGGGGGGTTTTTTTTTTTTTTTTTTTTT';

# Define the format
format STDOUT =
# The header line
>@<<<<<<<<< @<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<...
$id,        $description
# The DNA lines
^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<~~
$DNA
.

# Print the fasta-formatted DNA output
write;

exit;

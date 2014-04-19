#!/usr/bin/perl
# Example 11-4   Demonstrate File::Find

use strict;
use warnings;
use BeginPerlBioinfo;     # see Chapter 6 about this module

use File::Find;

find ( \&my_sub, ('pdb') );

sub my_sub {
    -f and (print $File::Find::name, "\n");
}

exit;

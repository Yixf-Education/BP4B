#!/usr/bin/perl
# Example 11-1   Demonstrating how to open a folder and list its contents

use strict;
use warnings;
use BeginPerlBioinfo;    # see Chapter 6 about this module

my @files  = ();
my $folder = 'pdb';

# open the folder
unless ( opendir( FOLDER, $folder ) ) {
    print "Cannot open folder $folder!\n";
    exit;
}

# read the contents of the folder (i.e. the files and subfolders)
@files = readdir(FOLDER);

# close the folder
closedir(FOLDER);

# print them out, one per line
print join( "\n", @files ), "\n";

exit;

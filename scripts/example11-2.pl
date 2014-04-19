#!/usr/bin/perl
# Example 11-2   Demonstrating how to open a folder and list its contents
#    -distinguishing between files and subfolders, which
#         are themselves listed

use strict;
use warnings;
use BeginPerlBioinfo;    # see Chapter 6 about this module

my @files  = ();
my $folder = 'pdb';

# Open the folder
unless ( opendir( FOLDER, $folder ) ) {
    print "Cannot open folder $folder!\n";
    exit;
}

# Read the folder, ignoring special entries "." and ".."
@files = grep ( !/^\.\.?$/, readdir(FOLDER) );

closedir(FOLDER);

# If file, print its name
# If folder, print its name and contents
#
# Notice that we need to prepend the folder name!
foreach my $file (@files) {

    # If the folder entry is a regular file
    if ( -f "$folder/$file" ) {
        print "$folder/$file\n";

        # If the folder entry is a subfolder
    }
    elsif ( -d "$folder/$file" ) {

        my $folder = "$folder/$file";

        # open the subfolder and list its contents
        unless ( opendir( FOLDER, "$folder" ) ) {
            print "Cannot open folder $folder!\n";
            exit;
        }

        my @files = grep ( !/^\.\.?$/, readdir(FOLDER) );

        closedir(FOLDER);

        foreach my $file (@files) {
            print "$folder/$file\n";
        }
    }
}

exit;

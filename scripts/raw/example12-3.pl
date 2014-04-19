#!/usr/bin/perl
# Example 12-3   Example of here document 

use strict;
use warnings;

my $DNA = 'AAACCCCCCGGGGGGGGTTTTTT';

for( my $i = 0 ; $i < 2 ; ++$i ) {
print <<HEREDOC;
     On iteration $i of the loop!
    $DNA

HEREDOC
}

exit;

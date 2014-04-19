#!/usr/bin/perl -w
# Example 5-1   if-elsif-else

$word = 'MNIDDKL';

# if-elsif-else conditionals
if ( $word eq 'QSTVSGE' ) {

    print "QSTVSGE\n";

}
elsif ( $word eq 'MRQQDMISHDEL' ) {

    print "MRQQDMISHDEL\n";

}
elsif ( $word eq 'MNIDDKL' ) {

    print "MNIDDKL-the magic word!\n";

}
else {

    print "Is \"$word\" a peptide? This program is not sure.\n";

}

exit;

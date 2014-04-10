#!/usr/bin/perl -w
# Example 4-2   Concatenating DNA

# Store two DNA fragments into two variables called $DNA1 and $DNA2
$DNA1 = 'ACGGGAGGACGGGAAAATTACTACGGCATTAGC';
$DNA2 = 'ATAGTGCCGTGAGAGTGATGTAGTA';

# Print the DNA onto the screen
print "Here are the original two DNA fragments:\n\n";

print $DNA1, "\n";

print $DNA2, "\n\n";

# Concatenate the DNA fragments into a third variable and print them
# Using "string interpolation"
$DNA3 = "$DNA1$DNA2";

print "Here is the concatenation of the first two fragments (version 1):\n\n";

print "$DNA3\n\n";

# An alternative way using the "dot operator":
# Concatenate the DNA fragments into a third variable and print them
$DNA3 = $DNA1 . $DNA2;

print "Here is the concatenation of the first two fragments (version 2):\n\n";

print "$DNA3\n\n";

# Print the same thing without using the variable $DNA3
print "Here is the concatenation of the first two fragments (version 3):\n\n";

print $DNA1, $DNA2, "\n";

exit;

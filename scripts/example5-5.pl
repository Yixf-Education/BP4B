#!/usr/bin/perl -w
# Example 5-5   Demonstration of Perl's built-in knowledge about numbers and strings

$num = 1234;

$str = '1234';

# print the variables
print $num, " ", $str, "\n";

# add the variables as numbers
$num_or_str = $num + $str;

print $num_or_str, "\n";

# concatenate the variables as strings
$num_or_str = $num . $str;

print $num_or_str, "\n";

exit;

#!/usr/bin/perl -w
# Example 7-1   Children's game, demonstrating primitive artificial intelligence,
#  using a random number generator to randomly select parts of sentences.

use strict;
use warnings;

# Declare the variables
my $count;
my $input;
my $number;
my $sentence;
my $story;

# Here are the arrays of parts of sentences:
my @nouns = (
    'Dad',     'TV',    'Mom',        'Groucho',
    'Rebecca', 'Harpo', 'Robin Hood', 'Joe and Moe',
);

my @verbs = (
    'ran to', 'giggled with', 'put hot sauce into the orange juice of',
    'exploded', 'dissolved', 'sang stupid songs with',
    'jumped with',
);

my @prepositions = (
    'at the store',
    'over the rainbow',
    'just for the fun of it',
    'at the beach',
    'before dinner',
    'in New York City',
    'in a dream',
    'around the world',
);

# Seed the random number generator.
# time|$$ combines the current time with the current process id
# in a somewhat weak attempt to come up with a random seed.
srand( time | $$ );

# This do-until loop composes six-sentence "stories".
#  until the user types "quit".
do {

    # (Re)set $story to the empty string each time through the loop
    $story = '';

    # Make 6 sentences per story.
    for ( $count = 0 ; $count < 6 ; $count++ ) {

        #  Notes on the following statements:
        #  1) scalar @array gives the number of elements in the array.
        #  2) rand returns a random number greater than 0 and
        #     less than scalar(@array).
        #  3) int removes the fractional part of a number.
        #  4) . joins two strings together.
        $sentence =
            $nouns[ int( rand( scalar @nouns ) ) ] . " "
          . $verbs[ int( rand( scalar @verbs ) ) ] . " "
          . $nouns[ int( rand( scalar @nouns ) ) ] . " "
          . $prepositions[ int( rand( scalar @prepositions ) ) ] . '. ';

        $story .= $sentence;
    }

    # Print the story.
    print "\n", $story, "\n";

    # Get user input.
    print "\nType \"quit\" to quit, or press Enter to continue: ";

    $input = <STDIN>;

    # Exit loop at user's request
} until ( $input =~ /^\s*q/i );

exit;

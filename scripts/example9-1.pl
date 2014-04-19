# Example 9-1 Translate IUB ambiguity codes to regular expressions
# IUB_to_regexp
#
# A subroutine that, given a sequence with IUB ambiguity codes,
# outputs a translation with IUB codes changed to regular expressions
#
# These are the IUB ambiguity codes
# (Eur. J. Biochem. 150: 1-5, 1985):
# R = G or A
# Y = C or T
# M = A or C
# K = G or T
# S = G or C
# W = A or T
# B = not A (C or G or T)
# D = not C (A or G or T)
# H = not G (A or C or T)
# V = not T (A or C or G)
# N = A or C or G or T

sub IUB_to_regexp {

    my ($iub) = @_;

    my $regular_expression = '';

    my %iub2character_class = (

        A => 'A',
        C => 'C',
        G => 'G',
        T => 'T',
        R => '[GA]',
        Y => '[CT]',
        M => '[AC]',
        K => '[GT]',
        S => '[GC]',
        W => '[AT]',
        B => '[CGT]',
        D => '[AGT]',
        H => '[ACT]',
        V => '[ACG]',
        N => '[ACGT]',
    );

    # Remove the ^ signs from the recognition sites
    $iub =~ s/\^//g;

    # Translate each character in the iub sequence
    for ( my $i = 0 ; $i < length($iub) ; ++$i ) {
        $regular_expression .= $iub2character_class{ substr( $iub, $i, 1 ) };
    }

    return $regular_expression;
}

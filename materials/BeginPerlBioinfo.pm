############################################################
#
# BeginPerlBioinfo.pm
# - a library of subroutines
#   from the examples and text in the book:
#
# Beginning Perl for Bioinformatics
# by James Tisdall
#
# published by O'Reilly & Associates
# (c) 2001 James Tisdall
#
# These subroutines are arranged alphabetically
#
# To use this module, add the line (without the comment):

# use BeginPerlBioinfo;

# to your code, making sure the module is in the same directory
# as the program you are using it from, or another place where
# Perl can find it (see the discussion in the book for other locations).
#
# Version 20011230
#   incorporates a few errata and bug fixes
#
############################################################



# From example6-1.pl

sub addACGT {
    my($dna) = @_;

    $dna .= 'ACGT';
    return $dna;
}



# From example6-2.pl

sub A_to_T {
    my($input) = @_;

    $dna = $input;

    $dna =~ s/A/T/g;

    return $dna;
}



# From example11-7.pl

# call_stride
#
# -given a PDB filename, return the output from the "stride"
#     secondary structure prediction program

sub call_stride {

    use strict;
    use warnings;

    my($filename) = @_;

    # The stride program options
    my($stride) = '/usr/local/bin/stride';
    my($options) = '';
    my(@results) = (  );

    # Check for presence of PDB file
    unless ( -e $filename ) {
        print "File \"$filename\" doesn\'t seem to exist!\n";
        exit;
    }

    # Start up the program, capture and return the output
    @results = `$stride $options $filename`;

    return @results;
}



# From Chapter 8

# codon2aa
#
# A subroutine to translate a DNA 3-character codon to an amino acid
#   Version 1

# This subroutine is commented out because a preferred version of it
# follows.

# sub codon2aa {
#     my($codon) = @_;
#     
#        if ( $codon =~ /TCA/i )    { return 'S' }    # Serine
#     elsif ( $codon =~ /TCC/i )    { return 'S' }    # Serine
#     elsif ( $codon =~ /TCG/i )    { return 'S' }    # Serine
#     elsif ( $codon =~ /TCT/i )    { return 'S' }    # Serine
#     elsif ( $codon =~ /TTC/i )    { return 'F' }    # Phenylalanine
#     elsif ( $codon =~ /TTT/i )    { return 'F' }    # Phenylalanine
#     elsif ( $codon =~ /TTA/i )    { return 'L' }    # Leucine
#     elsif ( $codon =~ /TTG/i )    { return 'L' }    # Leucine
#     elsif ( $codon =~ /TAC/i )    { return 'Y' }    # Tyrosine
#     elsif ( $codon =~ /TAT/i )    { return 'Y' }    # Tyrosine
#     elsif ( $codon =~ /TAA/i )    { return '_' }    # Stop
#     elsif ( $codon =~ /TAG/i )    { return '_' }    # Stop
#     elsif ( $codon =~ /TGC/i )    { return 'C' }    # Cysteine
#     elsif ( $codon =~ /TGT/i )    { return 'C' }    # Cysteine
#     elsif ( $codon =~ /TGA/i )    { return '_' }    # Stop
#     elsif ( $codon =~ /TGG/i )    { return 'W' }    # Tryptophan
#     elsif ( $codon =~ /CTA/i )    { return 'L' }    # Leucine
#     elsif ( $codon =~ /CTC/i )    { return 'L' }    # Leucine
#     elsif ( $codon =~ /CTG/i )    { return 'L' }    # Leucine
#     elsif ( $codon =~ /CTT/i )    { return 'L' }    # Leucine
#     elsif ( $codon =~ /CCA/i )    { return 'P' }    # Proline
#     elsif ( $codon =~ /CCC/i )    { return 'P' }    # Proline
#     elsif ( $codon =~ /CCG/i )    { return 'P' }    # Proline
#     elsif ( $codon =~ /CCT/i )    { return 'P' }    # Proline
#     elsif ( $codon =~ /CAC/i )    { return 'H' }    # Histidine
#     elsif ( $codon =~ /CAT/i )    { return 'H' }    # Histidine
#     elsif ( $codon =~ /CAA/i )    { return 'Q' }    # Glutamine
#     elsif ( $codon =~ /CAG/i )    { return 'Q' }    # Glutamine
#     elsif ( $codon =~ /CGA/i )    { return 'R' }    # Arginine
#     elsif ( $codon =~ /CGC/i )    { return 'R' }    # Arginine
#     elsif ( $codon =~ /CGG/i )    { return 'R' }    # Arginine
#     elsif ( $codon =~ /CGT/i )    { return 'R' }    # Arginine
#     elsif ( $codon =~ /ATA/i )    { return 'I' }    # Isoleucine
#     elsif ( $codon =~ /ATC/i )    { return 'I' }    # Isoleucine
#     elsif ( $codon =~ /ATT/i )    { return 'I' }    # Isoleucine
#     elsif ( $codon =~ /ATG/i )    { return 'M' }    # Methionine
#     elsif ( $codon =~ /ACA/i )    { return 'T' }    # Threonine
#     elsif ( $codon =~ /ACC/i )    { return 'T' }    # Threonine
#     elsif ( $codon =~ /ACG/i )    { return 'T' }    # Threonine
#     elsif ( $codon =~ /ACT/i )    { return 'T' }    # Threonine
#     elsif ( $codon =~ /AAC/i )    { return 'N' }    # Asparagine
#     elsif ( $codon =~ /AAT/i )    { return 'N' }    # Asparagine
#     elsif ( $codon =~ /AAA/i )    { return 'K' }    # Lysine
#     elsif ( $codon =~ /AAG/i )    { return 'K' }    # Lysine
#     elsif ( $codon =~ /AGC/i )    { return 'S' }    # Serine
#     elsif ( $codon =~ /AGT/i )    { return 'S' }    # Serine
#     elsif ( $codon =~ /AGA/i )    { return 'R' }    # Arginine
#     elsif ( $codon =~ /AGG/i )    { return 'R' }    # Arginine
#     elsif ( $codon =~ /GTA/i )    { return 'V' }    # Valine
#     elsif ( $codon =~ /GTC/i )    { return 'V' }    # Valine
#     elsif ( $codon =~ /GTG/i )    { return 'V' }    # Valine
#     elsif ( $codon =~ /GTT/i )    { return 'V' }    # Valine
#     elsif ( $codon =~ /GCA/i )    { return 'A' }    # Alanine
#     elsif ( $codon =~ /GCC/i )    { return 'A' }    # Alanine
#     elsif ( $codon =~ /GCG/i )    { return 'A' }    # Alanine
#     elsif ( $codon =~ /GCT/i )    { return 'A' }    # Alanine
#     elsif ( $codon =~ /GAC/i )    { return 'D' }    # Aspartic Acid
#     elsif ( $codon =~ /GAT/i )    { return 'D' }    # Aspartic Acid
#     elsif ( $codon =~ /GAA/i )    { return 'E' }    # Glutamic Acid
#     elsif ( $codon =~ /GAG/i )    { return 'E' }    # Glutamic Acid
#     elsif ( $codon =~ /GGA/i )    { return 'G' }    # Glycine
#     elsif ( $codon =~ /GGC/i )    { return 'G' }    # Glycine
#     elsif ( $codon =~ /GGG/i )    { return 'G' }    # Glycine
#     elsif ( $codon =~ /GGT/i )    { return 'G' }    # Glycine
#     else {
#         print STDERR "Bad codon \"$codon\"!!\n";
#         exit;
#     }
# }



# From Chapter 8

# codon2aa
#
# A subroutine to translate a DNA 3-character codon to an amino acid
#   Version 2

# This subroutine is commented out because a preferred version of it
# follows.

# sub codon2aa {
#     my($codon) = @_;
#  
#        if ( $codon =~ /GC./i)        { return 'A' }    # Alanine
#     elsif ( $codon =~ /TG[TC]/i)     { return 'C' }    # Cysteine
#     elsif ( $codon =~ /GA[TC]/i)     { return 'D' }    # Aspartic Acid
#     elsif ( $codon =~ /GA[AG]/i)     { return 'E' }    # Glutamic Acid
#     elsif ( $codon =~ /TT[TC]/i)     { return 'F' }    # Phenylalanine
#     elsif ( $codon =~ /GG./i)        { return 'G' }    # Glycine
#     elsif ( $codon =~ /CA[TC]/i)     { return 'H' }    # Histidine
#     elsif ( $codon =~ /AT[TCA]/i)    { return 'I' }    # Isoleucine
#     elsif ( $codon =~ /AA[AG]/i)     { return 'K' }    # Lysine
#     elsif ( $codon =~ /TT[AG]|CT./i) { return 'L' }    # Leucine
#     elsif ( $codon =~ /ATG/i)        { return 'M' }    # Methionine
#     elsif ( $codon =~ /AA[TC]/i)     { return 'N' }    # Asparagine
#     elsif ( $codon =~ /CC./i)        { return 'P' }    # Proline
#     elsif ( $codon =~ /CA[AG]/i)     { return 'Q' }    # Glutamine
#     elsif ( $codon =~ /CG.|AG[AG]/i) { return 'R' }    # Arginine
#     elsif ( $codon =~ /TC.|AG[TC]/i) { return 'S' }    # Serine
#     elsif ( $codon =~ /AC./i)        { return 'T' }    # Threonine
#     elsif ( $codon =~ /GT./i)        { return 'V' }    # Valine
#     elsif ( $codon =~ /TGG/i)        { return 'W' }    # Tryptophan
#     elsif ( $codon =~ /TA[TC]/i)     { return 'Y' }    # Tyrosine
#     elsif ( $codon =~ /TA[AG]|TGA/i) { return '_' }    # Stop
#     else {
#         print STDERR "Bad codon \"$codon\"!!\n";
#         exit;
#     }
# }



# From Chapter 8

#
# codon2aa
#
# A subroutine to translate a DNA 3-character codon to an amino acid
#   Version 3, using hash lookup

sub codon2aa {
    my($codon) = @_;

    $codon = uc $codon;
 
    my(%genetic_code) = (
    
    'TCA' => 'S',    # Serine
    'TCC' => 'S',    # Serine
    'TCG' => 'S',    # Serine
    'TCT' => 'S',    # Serine
    'TTC' => 'F',    # Phenylalanine
    'TTT' => 'F',    # Phenylalanine
    'TTA' => 'L',    # Leucine
    'TTG' => 'L',    # Leucine
    'TAC' => 'Y',    # Tyrosine
    'TAT' => 'Y',    # Tyrosine
    'TAA' => '_',    # Stop
    'TAG' => '_',    # Stop
    'TGC' => 'C',    # Cysteine
    'TGT' => 'C',    # Cysteine
    'TGA' => '_',    # Stop
    'TGG' => 'W',    # Tryptophan
    'CTA' => 'L',    # Leucine
    'CTC' => 'L',    # Leucine
    'CTG' => 'L',    # Leucine
    'CTT' => 'L',    # Leucine
    'CCA' => 'P',    # Proline
    'CCC' => 'P',    # Proline
    'CCG' => 'P',    # Proline
    'CCT' => 'P',    # Proline
    'CAC' => 'H',    # Histidine
    'CAT' => 'H',    # Histidine
    'CAA' => 'Q',    # Glutamine
    'CAG' => 'Q',    # Glutamine
    'CGA' => 'R',    # Arginine
    'CGC' => 'R',    # Arginine
    'CGG' => 'R',    # Arginine
    'CGT' => 'R',    # Arginine
    'ATA' => 'I',    # Isoleucine
    'ATC' => 'I',    # Isoleucine
    'ATT' => 'I',    # Isoleucine
    'ATG' => 'M',    # Methionine
    'ACA' => 'T',    # Threonine
    'ACC' => 'T',    # Threonine
    'ACG' => 'T',    # Threonine
    'ACT' => 'T',    # Threonine
    'AAC' => 'N',    # Asparagine
    'AAT' => 'N',    # Asparagine
    'AAA' => 'K',    # Lysine
    'AAG' => 'K',    # Lysine
    'AGC' => 'S',    # Serine
    'AGT' => 'S',    # Serine
    'AGA' => 'R',    # Arginine
    'AGG' => 'R',    # Arginine
    'GTA' => 'V',    # Valine
    'GTC' => 'V',    # Valine
    'GTG' => 'V',    # Valine
    'GTT' => 'V',    # Valine
    'GCA' => 'A',    # Alanine
    'GCC' => 'A',    # Alanine
    'GCG' => 'A',    # Alanine
    'GCT' => 'A',    # Alanine
    'GAC' => 'D',    # Aspartic Acid
    'GAT' => 'D',    # Aspartic Acid
    'GAA' => 'E',    # Glutamic Acid
    'GAG' => 'E',    # Glutamic Acid
    'GGA' => 'G',    # Glycine
    'GGC' => 'G',    # Glycine
    'GGG' => 'G',    # Glycine
    'GGT' => 'G',    # Glycine
    );

    if(exists $genetic_code{$codon}) {
        return $genetic_code{$codon};
    }else{

            print STDERR "Bad codon \"$codon\"!!\n";
            exit;
    }
}



# From example6-3.pl

sub countG {
    # return a count of the number of G's in the argument $dna

    # initialize arguments and variables
    my($dna) = @_;

    my($count) = 0;

    # Use the fourth method of counting nucleotides in DNA, as shown in
    # Chapter Four, "Motifs and Loops"
    $count = ( $dna =~ tr/Gg//);

    return $count;
}



# From Chapter 8

# dna2peptide 
#
# A subroutine to translate DNA sequence into a peptide

sub dna2peptide {

    my($dna) = @_;

    use strict;
    use warnings;
    use BeginPerlBioinfo;     # see Chapter 6 about this module

    # Initialize variables
    my $protein = '';

    # Translate each three-base codon to an amino acid, and append to a protein 
    for(my $i=0; $i < (length($dna) - 2) ; $i += 3) {
        $protein .= codon2aa( substr($dna,$i,3) );
    }

    return $protein;
}



# From example11-5.pl

# extractSEQRES
#
#-given an scalar containing SEQRES lines,
#    return an array containing the chains of the sequence

sub extractSEQRES {

    use strict;
    use warnings;

    my($seqres) = @_;

    my $lastchain = '';
    my $sequence = '';
    my @results = (  );
    # make array of lines

    my @record = split ( /\n/, $seqres);
    
    foreach my $line (@record) {
        # Chain is in column 12, residues start in column 20
        my ($thischain) = substr($line, 11, 1);
        my($residues)  = substr($line, 19, 52); # add space at end
    
        # Check if a new chain, or continuation of previous chain
        if("$lastchain" eq "") {
            $sequence = $residues;
        }elsif("$thischain" eq "$lastchain") {
            $sequence .= $residues;
    
        # Finish gathering previous chain (unless first record)
        }elsif ( $sequence ) {
            push(@results, $sequence);
            $sequence = $residues;
        }
        $lastchain = $thischain;
    }

    # save last chain
    push(@results, $sequence);
    
    return @results;
}



# From example12-2.pl

# extract_HSP_information
#
# -parse a HSP from a BLAST output alignment section
#        - return array with elements:
#    Expect value
#    Query string
#    Query range 
#    Subject string
#    Subject range

sub extract_HSP_information {

    my($HSP) = @_;
    
    # declare and initialize variables
    my($expect) = '';
    my($query) = '';
    my($query_range) = '';
    my($subject) = '';
    my($subject_range) = '';

    ($expect) = ($HSP =~ /Expect = (\S+)/);

    $query = join ( '' , ($HSP =~ /^Query.*\n/gm) );

    $subject = join ( '' , ($HSP =~ /^Sbjct.*\n/gm) );

    $query_range = join('..', ($query =~ /(\d+).*\D(\d+)/s));

    $subject_range = join('..', ($subject =~ /(\d+).*\D(\d+)/s));

    $query =~ s/[^acgt]//g;

    $subject =~ s/[^acgt]//g;

    return ($expect, $query, $query_range, $subject, $subject_range);
}



# From Chapter 8

# extract_sequence_from_fasta_data
#
# A subroutine to extract FASTA sequence data from an array

sub extract_sequence_from_fasta_data {

    my(@fasta_file_data) = @_;

    use strict;
    use warnings;

    # Declare and initialize variables
    my $sequence = '';

    foreach my $line (@fasta_file_data) {

        # discard blank line
        if ($line =~ /^\s*$/) {
            next;

        # discard comment line
        } elsif($line =~ /^\s*#/) {
            next;

        # discard fasta header line
        } elsif($line =~ /^>/) {
            next;

        # keep line, add to sequence string
        } else {
            $sequence .= $line;
        }
    }

    # remove non-sequence data (in this case, whitespace) from $sequence string
    $sequence =~ s/\s//g;

    return $sequence;
}


# From example10-5.pl

# get_annotation_and_dna
#
#   - given filehandle to open GenBank library file, get next record

sub get_annotation_and_dna {

    my($record) = @_;

    my($annotation) = '';
    my($dna) = '';

    # Now separate the annotation from the sequence data
    ($annotation, $dna) = ($record =~ /^(LOCUS.*ORIGIN\s*\n)(.*)\/\/\n/s);

    # clean the sequence of any whitespace or / characters 
    #  (the / has to be written \/ in the character class, because
    #   / is a metacharacter, so it must be "escaped" with \)
    $dna =~ s/[\s\/\d]//g;

    return($annotation, $dna)
}



# From Chapter 8

# A Subroutine to Read FASTA Files

# get_file_data
#
# A subroutine to get data from a file given its filename

sub get_file_data {

    my($filename) = @_;

    use strict;
    use warnings;

    # Initialize variables
    my @filedata = (  );

    unless( open(GET_FILE_DATA, $filename) ) {
        print STDERR "Cannot open file \"$filename\"\n\n";
        exit;
    }

    @filedata = <GET_FILE_DATA>;

    close GET_FILE_DATA;

    return @filedata;
}



# From example10-5.pl

# get_next_record
#
#   - given GenBank record, get annotation and DNA

sub get_next_record {

    my($fh) = @_;

    my($offset);
    my($record) = '';
    my($save_input_separator) = $/;

    $/ = "//\n";

    $record = <$fh>;

    $/ = $save_input_separator;

    return $record;
}



# From example11-5.pl

# iub3to1
#
#-change string of 3-character IUB amino acid codes (whitespace separated)
#    into a string of 1-character amino acid codes

sub iub3to1 {

    my($input) = @_;
    
    my %three2one = (
      'ALA' => 'A',
      'VAL' => 'V',
      'LEU' => 'L',
      'ILE' => 'I',
      'PRO' => 'P',
      'TRP' => 'W',
      'PHE' => 'F',
      'MET' => 'M',
      'GLY' => 'G',
      'SER' => 'S',
      'THR' => 'T',
      'TYR' => 'Y',
      'CYS' => 'C',
      'ASN' => 'N',
      'GLN' => 'Q',
      'LYS' => 'K',
      'ARG' => 'R',
      'HIS' => 'H',
      'ASP' => 'D',
      'GLU' => 'E',
    );

    # clean up the input
    $input =~ s/\n/ /g;

    my $seq = '';
    
    # This use of split separates on any contiguous whitespace
    my @code3 = split(' ', $input);

    foreach my $code (@code3) {
        # A little error checking
        if(not defined $three2one{$code}) {
            print "Code $code not defined\n";
            next;
        }
        $seq .= $three2one{$code};
    }
    return $seq;
}



# From example9-1.pl

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

    my($iub) = @_;

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
        $regular_expression
          .= $iub2character_class{substr($iub, $i, 1)};
    }

    return $regular_expression;
}



# From example11-3.pl

# list_recursively
#
#   list the contents of a directory,
#              recursively listing the contents of any subdirectories

sub list_recursively {

    my($directory) = @_;

    my @files = (  );
    
    # Open the directory
    unless(opendir(DIRECTORY, $directory)) {
        print "Cannot open directory $directory!\n";
        exit;
    }
    
    # Read the directory, ignoring special entries "." and ".."
    #
    @files = grep (!/^\.\.?$/, readdir(DIRECTORY));
    
    closedir(DIRECTORY);
    
    # If file, print its name
    # If directory, recursively print its contents

    # Notice that we need to prepend the directory name!
    foreach my $file (@files) {
    
        # If the directory entry is a regular file
        if (-f "$directory/$file") {
    
            print "$directory/$file\n";
        
        # If the directory entry is a subdirectory
        }elsif( -d "$directory/$file") {

            # Here is the recursive call to this subroutine
            list_recursively("$directory/$file");
        }
    }
}



# From example7-3.pl
#   and
# From example7-4.pl

# make_random_DNA
#
# Make a string of random DNA of specified length.
#
# WARNING: make sure you call srand to seed the
#  random number generator before you call this function.

sub make_random_DNA {

    # Collect arguments, declare variables
    my($length) = @_;

    my $dna;

    for (my $i=0 ; $i < $length ; ++$i) {
        $dna .= randomnucleotide(  );
    }

    return $dna;
}



# From example7-3.pl
#   and
# From example7-4.pl

# make_random_DNA_set
#
# Make a set of random DNA
#
#   Accept parameters setting the maximum and minimum length of
#     each string of DNA, and the number of DNA strings to make
#
# WARNING: make sure you call srand to seed the
#  random number generator before you call this function.

sub make_random_DNA_set {

    # Collect arguments, declare variables
    my($minimum_length, $maximum_length, $size_of_set) = @_;

    # length of each DNA fragment
    my $length;
    
    # DNA fragment
    my $dna;

    # set of DNA fragments
    my @set;

    # Create set of random DNA
    for (my $i = 0; $i < $size_of_set ; ++$i) {

        # find a random length between min and max
        $length = randomlength ($minimum_length, $maximum_length);

        # make a random DNA fragment
        $dna = make_random_DNA ( $length );

        # add $dna fragment to @set
        push( @set, $dna );
    }

    return @set;
}



# From example9-3.pl

#
# Find locations of a match of a regular expression in a string
#
# 
# return an array of positions where the regular expression
#  appears in the string
#

sub match_positions {

    my($regexp, $sequence) = @_;

    use strict;

    use BeginPerlBioinfo;     # see Chapter 6 about this module

    #
    # Declare variables
    #

    my @positions = (  );

    #
    # Determine positions of regular expression matches
    #
    
    while ( $sequence =~ /$regexp/ig ) {

        push ( @positions, pos($sequence) - length($&) + 1);
    }

    return @positions;
}



# From example7-4.pl

# matching_percentage
#
# Subroutine to calculate the percentage of identical bases in two
# equal length DNA sequences

sub matching_percentage {

    my($string1, $string2) = @_;

    # we assume that the strings have the same length
    my($length) = length($string1);
    my($position);
    my($count) = 0;

    for ($position=0; $position < $length ; ++$position) {
        if(substr($string1,$position,1) eq substr($string2,$position,1)) {
            ++$count;
        }
    }

    return $count / $length;
}



# From example7-2.pl

# A subroutine to perform a mutation in a string of DNA
#
# WARNING: make sure you call srand to seed the
#  random number generator before you call this function.

sub mutate {

    my($dna) = @_;

    my(@nucleotides) = ('A', 'C', 'G', 'T');

    # Pick a random position in the DNA
    my($position) = randomposition($dna);

    # Pick a random nucleotide
    my($newbase) = randomnucleotide(@nucleotides);

    # Insert the random nucleotide into the random position in the DNA
    # The substr arguments mean the following:
    #  In the string $dna at position $position change 1 character to
    #  the string in $newbase
    substr($dna,$position,1,$newbase);

    return $dna;
}


# From Chapter 7

# mutate_better
#
# Subroutine to perform a mutation in a string of DNA-version 2, in which
#  it is guaranteed that one base will change on each call
#
# WARNING: make sure you call srand to seed the
#  random number generator before you call this function.

sub mutate_better {

    my($dna) = @_;
    my(@nucleotides) = ('A', 'C', 'G', 'T');

    # Pick a random position in the DNA
    my($position) = randomposition($dna);

    # Pick a random nucleotide
    my($newbase);

    do {
        $newbase = randomnucleotide(@nucleotides);

    # Make sure it's different than the nucleotide we're mutating
    }until ( $newbase ne substr($dna, $position,1) );

    # Insert the random nucleotide into the random position in the DNA
    # The substr arguments mean the following:
    #  In the string $dna at position $position change 1 character to
    #  the string in $newbase
    substr($dna,$position,1,$newbase);

    return $dna;
}


# From example11-4.pl

# Example 11-4   Demonstrate File::Find

sub my_sub {
    -f and (print $File::Find::name, "\n");
}



# From example10-5.pl

# open_file
#
#   - given filename, set filehandle

sub open_file {

    my($filename) = @_;
    my $fh;

    unless(open($fh, $filename)) {
        print "Cannot open file $filename\n";
        exit;
    }
    return $fh;
}



# From example10-1.pl

# parse1
#
# -parse annotation and sequence from GenBank record

sub parse1 {

    my($annotation, $dna, $filename) = @_;

    # $annotation-reference to array
    # $dna       -reference to scalar
    # $filename  -scalar
    
    # declare and initialize variables
    my $in_sequence = 0; 
    my @GenBankFile = (  );
    
    # Get the GenBank data into an array from a file
    @GenBankFile = get_file_data($filename);
    
    # Extract all the sequence lines
    foreach my $line (@GenBankFile) {

        if( $line =~ /^\/\/\n/ ) { # If $line is end-of-record line //\n,
            last; #break out of the foreach loop.
        } elsif( $in_sequence) { # If we know we're in a sequence,
            $$dna .= $line; # add the current line to $$dna.
        } elsif ( $line =~ /^ORIGIN/ ) { # If $line begins a sequence,
            $in_sequence = 1; # set the $in_sequence flag.
        } else{ # Otherwise
            push( @$annotation, $line); # add the current line to @annotation.
        }
    }
    
    # remove whitespace and line numbers from DNA sequence
    $$dna =~ s/[\s0-9]//g;
}



# From example11-6.pl

# parseATOM
#
# -extract x, y, and z coordinates, serial number and element symbol
#     from PDB ATOM record type
#      Return a hash with key=serial number, value=coordinates in a string

sub parseATOM {

    my($atomrecord) = @_;

    use strict;
    use warnings;
    my %results = (  );

    # Turn the scalar into an array of ATOM lines
    my(@atomrecord) = split(/\n/, $atomrecord);

    foreach my $record (@atomrecord) {
       my $number  = substr($record,  6, 5);  # columns 7-11
       my $x       = substr($record, 30, 8);  # columns 31-38
       my $y       = substr($record, 38, 8);  # columns 39-46
       my $z       = substr($record, 46, 8);  # columns 47-54
       my $element = substr($record, 76, 2);  # columns 77-78

        # $number and $element may have leading spaces: strip them
        $number =~ s/^\s*//;
        $element =~ s/^\s*//;

        # Store information in hash
        $results{$number} = "$x $y $z $element";
    }

    # Return the hash
    return %results;
}



# From example11-5.pl

# parsePDBrecordtypes
#
#-given an array of a PDB file, return a hash with
#    keys   = record type names
#    values = scalar containing lines for that record type 

sub parsePDBrecordtypes {

    my @file = @_;

    use strict;
    use warnings;
    
    my %recordtypes = (  );
    
    foreach my $line (@file) {
    
        # Get the record type name which begins at the
        # start of the line and ends at the first space

        # The pattern (\S+) is returned and saved in $recordtype
        my($recordtype) = ($line =~ /^(\S+)/);
    
        # .= fails if a key is undefined, so we have to
        # test for definition and use either .= or = depending
        if(defined $recordtypes{$recordtype} ) {
            $recordtypes{$recordtype} .= $line;
        }else{
            $recordtypes{$recordtype} = $line;
        }
    }
    
    return %recordtypes;
}



# From example9-2.pl

# Example 9-2 Subroutine to parse a REBASE datafile 
# parseREBASE-Parse REBASE bionet file
#
# A subroutine to return a hash where
#    key   = restriction enzyme name
#    value = whitespace-separated recognition site and regular expression

sub parseREBASE {

    my($rebasefile) = @_;

    use strict;
    use warnings;
    use BeginPerlBioinfo;     # see Chapter 6 about this module

    # Declare variables
    my @rebasefile = (  );
    my %rebase_hash = (  );
    my $name;
    my $site;
    my $regexp;

    # Read in the REBASE file
    my $rebase_filehandle = open_file($rebasefile);

    while(<$rebase_filehandle>) {

        # Discard header lines
        ( 1 .. /Rich Roberts/ ) and next;

        # Discard blank lines
        /^\s*$/ and next;
    
        # Split the two (or three if includes parenthesized name) fields
        my @fields = split( " ", $_);

        # Get and store the name and the recognition site

        # Remove parenthesized names, for simplicity's sake,
        # by not saving the middle field, if any,
        # just the first and last
        $name = shift @fields;

        $site = pop @fields;

        # Translate the recognition sites to regular expressions
        $regexp = IUB_to_regexp($site);

        # Store the data into the hash
        $rebase_hash{$name} = "$site $regexp";
    }

    # Return the hash containing the reformatted REBASE data
    return %rebase_hash;
}



# From example10-6.pl

# parse_annotation
#
#  given a GenBank annotation, returns a hash  with
#   keys: the field names
#   values: the fields

sub parse_annotation {

    my($annotation) = @_; 
    my(%results) = (  );

    while( $annotation =~ /^[A-Z].*\n(^\s.*\n)*/gm ) {
        my $value = $&;
        (my $key = $value) =~ s/^([A-Z]+).*/$1/s;
        $results{$key} = $value;
    }

    return %results;
}



# From example12-1.pl

# parse_blast
#
# -parse beginning and ending annotation, and alignments,
#     from BLAST output file

sub parse_blast {

    my($beginning_annotation, $ending_annotation, $alignments, $filename) = @_;

    # $beginning_annotation-reference to scalar
    # $ending_annotation   -reference to scalar
    # $alignments          -reference to hash
    # $filename            -scalar
    
    # declare and initialize variables
    my $blast_output_file = '';
    my $alignment_section = '';
    
    # Get the BLAST program output into an array from a file
    $blast_output_file = join( '', get_file_data($filename));

    # Extract the beginning annotation, alignments, and ending annotation
    ($$beginning_annotation, $alignment_section, $$ending_annotation)
    = ($blast_output_file =~ /(.*^ALIGNMENTS\n)(.*)(^  Database:.*)/ms);
    
    # Populate %alignments hash
    # key = ID of hit
    # value = alignment section
    %$alignments = parse_blast_alignment($alignment_section);
}



# From example12-1.pl

# parse_blast_alignment
#
# -parse the alignments from a BLAST output file,
#       return hash with
#       key = ID
#       value = text of alignment

sub parse_blast_alignment {

    my($alignment_section) = @_;
    
    # declare and initialize variables
    my(%alignment_hash) = (  );

    # loop through the scalar containing the BLAST alignments,
    # extracting the ID and the alignment and storing in a hash
    #
    # The regular expression matches a line beginning with >,
    # and containing the ID between the first pair of | characters;
    # followed by any number of lines that don't begin with >

    while($alignment_section =~ /^>.*\n(^(?!>).*\n)+/gm) {
        my($value) = $&;
        my($key) = (split(/\|/, $value)) [1];
        $alignment_hash{$key} = $value;
    }

    return %alignment_hash;
}



# From example12-2.pl

# parse_blast_alignment_HSP
#
# -parse beginning annotation, and HSPs,
#     from BLAST alignment
#     Return an array with first element set to the beginning annotation,
#    and each successive element set to an HSP

sub parse_blast_alignment_HSP {

    my($alignment ) = @_;

    # declare and initialize variables
    my $beginning_annotation  = '';
    my $HSP_section  = '';
    my @HSPs = (  );
    
    # Extract the beginning annotation and HSPs
    ($beginning_annotation, $HSP_section )
        = ($alignment =~ /(.*?)(^ Score =.*)/ms);

    # Store the $beginning_annotation as the first entry in @HSPs
    push(@HSPs, $beginning_annotation);

    # Parse the HSPs, store each HSP as an element in @HSPs
    while($HSP_section =~ /(^ Score =.*\n)(^(?! Score =).*\n)+/gm) {
        push(@HSPs, $&);
    }

    # Return an array with first element = the beginning annotation,
    # and each successive element = an HSP
    return(@HSPs);
}



# From Example 10-8

# parse_features
#
#  extract the features from the FEATURES field of a GenBank record

sub parse_features {

    my($features) = @_;   # entire FEATURES field in a scalar variable

    # Declare and initialize variables
    my(@features) = ();   # used to store the individual features

    # Extract the features
    while( $features =~ /^ {5}\S.*\n(^ {21}\S.*\n)*/gm ) {

        my $feature = $&;
        push(@features, $feature);

    }

    return @features;
}



# From example11-7.pl

# parse_stride
#
#-given stride output, extract the primary sequence and the
#    secondary structure prediction, returning them in a
#    two-element array.

sub parse_stride {

    use strict;
    use warnings;

    my(@stridereport) = @_;
    my($seq) = '';
    my($str) = '';
    my $length;

    # Extract the lines of interest
    my(@seq) = grep(/^SEQ /, @stridereport);

    my(@str) = grep(/^STR /, @stridereport);

    # Process those lines to discard all but the sequence
    #  or structure information
    for (@seq) { $_ = substr($_, 10, 50) }
    for (@str) { $_ = substr($_, 10, 50) }

    # Return the information as an array of two strings
    $seq = join('', @seq);
    $str = join('', @str);

    # Delete unwanted spaces from the ends of the strings.
    # ($seq has no spaces that are wanted, but $str may)
    $seq =~ s/(\s+)$//;

    $length = length($1);

    $str =~ s/\s{$length}$//;

    return( ($seq, $str) );
}



# From Chapter 8

# print_sequence
#
# A subroutine to format and print sequence data 

sub print_sequence {

    my($sequence, $length) = @_;

    use strict;
    use warnings;

    # Print sequence in lines of $length
    for ( my $pos = 0 ; $pos < length($sequence) ; $pos += $length ) {
        print substr($sequence, $pos, $length), "\n";
    }
}



# From example7-2.pl
#   and
# From example7-3.pl
#   and
# From example7-4.pl

# randomelement
#
# randomly select an element from an array
#
# WARNING: make sure you call srand to seed the
#  random number generator before you call this function.

sub randomelement {

    my(@array) = @_;

    return $array[rand @array];
}



# From example7-4.pl
#   and
# From example7-3.pl

# randomlength
#
# A subroutine that will pick a random number from
# $minlength to $maxlength, inclusive.
#
# WARNING: make sure you call srand to seed the
#  random number generator before you call this function.

sub randomlength {

    # Collect arguments, declare variables
    my($minlength, $maxlength) = @_;

    # Calculate and return a random number within the
    #  desired interval.
    # Notice how we need to add one to make the endpoints inclusive,
    #  and how we first subtract, then add back, $minlength to
    #  get the random number in the correct interval.
    return ( int(rand($maxlength - $minlength + 1)) + $minlength );
}



# From example7-2.pl
#   and
# From example7-3.pl
#   and
# From example7-4.pl

# randomnucleotide
#
# Select at random one of the four nucleotides
#
# WARNING: make sure you call srand to seed the
#  random number generator before you call this function.

sub randomnucleotide {

    my(@nucleotides) = ('A', 'C', 'G', 'T');

    # scalar returns the size of an array. 
    # The elements of the array are numbered 0 to size-1
    return randomelement(@nucleotides);
}



# From example7-2.pl

# randomposition
#
# A subroutine to randomly select a position in a string.
#
# WARNING: make sure you call srand to seed the
#  random number generator before you call this function.

sub randomposition {

    my($string) = @_;

    # Notice the "nested" arguments:
    #
    # $string is the argument to length
    # length($string) is the argument to rand
    # rand(length($string))) is the argument to int
    # int(rand(length($string))) is the argument to return
    # But we write it without parentheses, as permitted.
    #
    # rand returns a decimal number between 0 and its argument.
    # int returns the integer portion of a decimal number.
    #
    # The whole expression returns a random number between 0 and length-1,
    #  which is how the positions in a string are numbered in Perl.
    #

    return int rand length $string;
}



# From Chapter 8

# revcom 
#
# A subroutine to compute the reverse complement of DNA sequence

sub revcom {

    my($dna) = @_;

    # First reverse the sequence
    my $revcom = reverse $dna;

    # Next, complement the sequence, dealing with upper and lower case
    # A->T, T->A, C->G, G->C
    $revcom =~ tr/ACGTacgt/TGCAtgca/;

    return $revcom;
}



# From example10-5.pl

# search_annotation
#
#   - search annotation with regular expression

sub search_annotation {

    my($annotation, $regularexpression) = @_;

    my(@locations) = (  );

    # note the /s modifier-. matches any character including newline
    while( $annotation =~ /$regularexpression/isg ) {
        push( @locations, pos );
    }

    return (@locations);
}



# From example10-5.pl

# search_sequence
#
#   - search sequence with regular expression

sub search_sequence {

    my($sequence, $regularexpression) = @_;

    my(@locations) = (  );

    while( $sequence =~ /$regularexpression/ig ) {
        push( @locations, pos );
    }

    return (@locations);
}

#
# ".pm" files need to end with a statement that evaluates as "true"
#



# From Chapter 8

# translate_frame
#
# A subroutine to translate a frame of DNA

sub translate_frame {

    my($seq, $start, $end) = @_;

    my $protein;

    # To make the subroutine easier to use, you won't need to specify
    #  the end point-it will just go to the end of the sequence
    #  by default.
    unless($end) {
        $end = length($seq);
    }

    # Finally, calculate and return the translation
        return dna2peptide ( substr ( $seq, $start - 1, $end -$start + 1) );
}



1;

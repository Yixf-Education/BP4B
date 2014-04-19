#!/usr/bin/perl -w
# Example 5-7   Determining frequency of nucleotides, take 3

# Get the DNA sequence data
print "Please type the filename of the DNA sequence data: ";

$dna_filename = <STDIN>;

chomp $dna_filename;

# Does the file exist?
unless ( -e $dna_filename ) {

    print "File \"$dna_filename\" doesn\'t seem to exist!!\n";
    exit;
}

# Can we open the file?
unless ( open( DNAFILE, $dna_filename ) ) {

    print "Cannot open file \"$dna_filename\"\n\n";
    exit;
}

@DNA = <DNAFILE>;

close DNAFILE;

$DNA = join( '', @DNA );

# Remove whitespace
$DNA =~ s/\s//g;

# Initialize the counts.
# Notice that we can use scalar variables to hold numbers.
$a = 0;
$c = 0;
$g = 0;
$t = 0;
$e = 0;

# Use a regular expression "trick", and five while loops,
#  to find the counts of the four bases plus errors
while ( $DNA =~ /a/ig )       { $a++ }
while ( $DNA =~ /c/ig )       { $c++ }
while ( $DNA =~ /g/ig )       { $g++ }
while ( $DNA =~ /t/ig )       { $t++ }
while ( $DNA =~ /[^acgt]/ig ) { $e++ }

print "A=$a C=$c G=$g T=$t errors=$e\n";

# Also write the results to a file called "countbase"
$outputfile = "countbase";

unless ( open( COUNTBASE, ">$outputfile" ) ) {

    print "Cannot open file \"$outputfile\" to write to!!\n\n";
    exit;
}

print COUNTBASE "A=$a C=$c G=$g T=$t errors=$e\n";

close(COUNTBASE);

# exit the program
exit;

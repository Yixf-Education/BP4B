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

#!/usr/bin/env perl
use 5.010;
use strict;
use warnings;

BEGIN {
    my %fatpacked = ('My/X.pm' => 'package My::X; our $x = 42;');
    unshift @INC, sub {
        my ($this_subref, $filename) = @_;
        
        my $source_code = $fatpacked{$filename}
            or return;
        open my $fh, '<', \$source_code;
        return $fh;
    };
}

# funkt:
use My::X;
print "x = $My::X::x\n";

# funt auch:
# do 'My/X.pm';
# print "x = $My::X::x\n";

# nix geht:
# use Module::Pluggable search_path => 'Moo';
# say for __PACKAGE__->plugins;
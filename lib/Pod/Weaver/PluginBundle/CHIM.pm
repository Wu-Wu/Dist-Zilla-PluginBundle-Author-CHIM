package Pod::Weaver::PluginBundle::CHIM;

# ABSTRACT: CHIM's default Pod::Weaver configuration

use strict;
use warnings;

# VERSION
# AUTHORITY

use namespace::autoclean;

use Pod::Weaver 4;
use Pod::Weaver::Config::Assembler;

=head1 OVERVIEW

todo...

=cut

=for Pod::Coverage _exp

=cut

sub _exp {
    my ( $package ) = @_;
    return Pod::Weaver::Config::Assembler->expand_package( $package );
}

=method mvp_bundle_config

todo...

=cut

sub mvp_bundle_config {
    return (
        [ '@CHIM/SingleEncoding',   _exp('-SingleEncoding'), {} ],
        [ '@CHIM/CorePrep',         _exp('@CorePrep'), {} ],
        [ '@CHIM/Name',             _exp('Name'),      {} ],
        [ '@CHIM/Version',          _exp('Version'),   {} ],

        [ '@CHIM/prelude',          _exp('Region'),  { region_name => 'prelude' } ],
        [ 'SYNOPSIS',               _exp('Generic'), {} ],
        [ 'DESCRIPTION',            _exp('Generic'), {} ],
        [ 'OVERVIEW',               _exp('Generic'), {} ],

        [ 'ATTRIBUTES',             _exp('Collect'), { command => 'attr' } ],
        [ 'METHODS',                _exp('Collect'), { command => 'method' } ],
        [ 'FUNCTIONS',              _exp('Collect'), { command => 'func' } ],

        [ '@CHIM/Leftovers',        _exp('Leftovers'), {} ],

        [ '@CHIM/postlude',         _exp('Region'), { region_name => 'postlude' } ],

        [ '@CHIM/Bugs',             _exp('Bugs'),    {} ],
        [ '@CHIM/Authors',          _exp('Authors'), {} ],
        [ '@CHIM/Legal',            _exp('Legal'),   {} ],
    );
}

1;

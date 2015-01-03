package Pod::Weaver::PluginBundle::CHIM;

# ABSTRACT: CHIM's default Pod::Weaver configuration

use strict;
use warnings;

# VERSION
# AUTHORITY

use namespace::autoclean;

use Pod::Weaver 4;
use Pod::Weaver::Config::Assembler;
use Pod::Weaver::Section::SeeAlso;

=head1 SYNOPSIS

In C<weaver.ini>

    [@CHIM]

or in C<dist.ini>

    [PodWeaver]
    config_plugin = @CHIM

=head1 DESCRIPTION

This is config for L<Pod::Weaver> I use to build documentation for my modules.

=head1 OVERVIEW

This plugin bundle is equivalent to the following C<weaver.ini> config:

    [-SingleEnconding]

    [@CorePrep]

    [Name]
    [Version]

    [Region / prelude]

    [Generic / SYNOPSIS]
    [Generic / DESCRIPTION]
    [Generic / OVERVIEW]

    [Collect / TYPES]
    command = type

    [Collect / ATTRIBUTES]
    command = attr

    [Collect / METHODS]
    command = method

    [Collect / FUNCTIONS]
    command = func

    [Leftovers]

    [Region / postlude]

    [SeeAlso]
    [Bugs]
    [Author]
    [Legal]

=cut

=for Pod::Coverage _exp

=cut

sub _exp {
    my ( $package ) = @_;
    return Pod::Weaver::Config::Assembler->expand_package( $package );
}

=for Pod::Coverage mvp_bundle_config

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

        [ 'TYPES',                  _exp('Collect'), { command => 'type' } ],
        [ 'ATTRIBUTES',             _exp('Collect'), { command => 'attr' } ],
        [ 'METHODS',                _exp('Collect'), { command => 'method' } ],
        [ 'FUNCTIONS',              _exp('Collect'), { command => 'func' } ],

        [ '@CHIM/Leftovers',        _exp('Leftovers'), {} ],

        [ '@CHIM/postlude',         _exp('Region'), { region_name => 'postlude' } ],

        [ '@CHIM/SeeAlso',          _exp('SeeAlso'), {} ],
        [ '@CHIM/Bugs',             _exp('Bugs'),    {} ],
        [ '@CHIM/Authors',          _exp('Authors'), {} ],
        [ '@CHIM/Legal',            _exp('Legal'),   {} ],
    );
}

=head1 SEE ALSO

Pod::Weaver

Dist::Zilla::Plugin::PodWeaver

=cut

1;

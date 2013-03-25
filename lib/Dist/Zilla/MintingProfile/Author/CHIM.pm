package Dist::Zilla::MintingProfile::Author::CHIM;

# ABSTRACT: Make new modules like CHIM does

use strict;
use warnings;

# VERSION
# AUTHORITY

use Moose;
with 'Dist::Zilla::Role::MintingProfile::ShareDir';

__PACKAGE__->meta->make_immutable;
no Moose;

1; # End of Dist::Zilla::MintingProfile::Author::CHIM

__END__

=pod

=head1 SYNOPSYS

    % dzil new -P Author::CHIM Pretty::Cool::Module

=head1 DESCRIPTION

This installs a Dist::Zilla minting profile used by CHIM.

=head1 SEE ALSO

L<Dist::Zilla>

L<Dist::Zilla::PluginBundle::Author::CHIM>

=cut

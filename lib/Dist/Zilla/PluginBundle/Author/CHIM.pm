package Dist::Zilla::PluginBundle::Author::CHIM;

# ABSTRACT: Dist::Zilla configuration the way CHIM does it
# AUTHORITY
# VERSION

use Moose;

use Dist::Zilla 4.3;
with 'Dist::Zilla::Role::PluginBundle::Easy';

has dist => (
    is       => 'ro',
    isa      => 'Str',
    lazy     => 1,
    default  => sub { $_[0]->payload->{dist} },
);

has authority => (
    is       => 'ro',
    isa      => 'Str',
    lazy     => 1,
    default  => sub { $_[0]->payload->{authority} || 'cpan:CHIM' },
);

has github_username => (
    is       => 'ro',
    isa      => 'Str',
    lazy     => 1,
    default  => sub { $_[0]->payload->{github_username} || 'Wu-Wu' },
);

has github_reponame => (
    is       => 'ro',
    isa      => 'Str',
    lazy     => 1,
    default  => sub { $_[0]->payload->{github_reponame} || $_[0]->dist },
);

has github_repopath => (
    is       => 'ro',
    isa      => 'Str',
    lazy     => 1,
    default  => sub { join '/' => 'github.com', $_[0]->github_username, $_[0]->github_reponame },
);


sub configure {
    my ($self) = @_;

    $self->add_plugins(
        [ 'GatherDir'               => {} ],
        [ 'PruneCruft'              => {} ],

        # modified files
        [ 'OurPkgVersion'           => {} ],
        [ 'PodWeaver'               => {} ],
        [ 'Authority'               => {
                'authority'      => $self->authority,
                'do_metadata'    => 1,
                'locate_comment' => 1,
            }
        ],

        # generated files
        [ 'License'                 => {} ],
        [ 'ReadmeFromPod'           => {} ],
        [ 'ReadmeAnyFromPod'        => {} ],
        [ 'ReadmeAnyFromPod'        =>
            'ReadmePodInRoot' => {
                'type'     => 'pod',
                'filename' => 'README.pod',
                'location' => 'root',
            },
        ],

        [ 'MetaNoIndex'             => {
                'directory' => [qw(t xt eg examples corpus)],
                'package'   => [qw(DB)],
                'namespace' => [qw(t::lib)],
            },
        ],

        # set META resources
        [ 'MetaResources'           => {
                'homepage'        => 'https://metacpan.org/release/' . $self->dist,
                'repository.url'  => 'git://'   . $self->github_repopath . '.git',
                'repository.web'  => 'https://' . $self->github_repopath,
                'bugtracker.web'  => 'https://' . $self->github_repopath . '/issues',
                'repository.type' => 'git',
            },
        ],

        # add 'provides' to META
        [ 'MetaProvides::Package'   => {
                'meta_noindex' => 1,
            },
        ],

        # META files
        [ 'MetaYAML'                => {} ],
        [ 'MetaJSON'                => {} ],

        # t tests
        [ 'Test::Compile'           => {
                'fake_home' => 1
            }
        ],

        # xt tests
        [ 'ExtraTests'              => {} ],
        [ 'MetaTests'               => {} ],
        [ 'PodSyntaxTests'          => {} ],
        [ 'PodCoverageTests'        => {} ],
        [ 'Test::Version'           => {} ],
        [ 'Test::Kwalitee'          => {} ],

        # build
        [ 'MakeMaker'               => {} ],
        [ 'Manifest'                => {} ],

    );


}

__PACKAGE__->meta->make_immutable;
no Moose;
1;
__END__
=pod

=head1 SYNOPSYS

    # in dist.ini
    [@Author::CHIM]
    authority = 'cpan:CHIM'
    github_username = 'Wu-Wu'

=head1 DESCRIPTION

This is a L<Dist::Zilla> PluginBundle. It is roughly equivalent to the
following dist.ini:

=head1 SEE ALSO

L<Dist::Zilla>

=cut


# NAME

Dist::Zilla::PluginBundle::Author::CHIM - Dist::Zilla configuration the way CHIM does it

# VERSION

version 0.04

# DESCRIPTION

This is a [Dist::Zilla](http://search.cpan.org/perldoc?Dist::Zilla) PluginBundle. It is roughly equivalent to the
following dist.ini:

    [GatherDir]
    [PruneCruft]

    ;; modified files
    [OurPkgVersion]
    [PodWeaver]
    [NextRelease]
    time_zone = UTC
    format    = %-7v %{EEE MMM d HH:mm:ss yyyy ZZZ}d
    [Authority]
    authority      = %{authority}
    do_metadata    = 1
    locate_comment = 1

    ;; generated files
    [License]
    [ReadmeFromPod]
    [ReadmeAnyFromPod]
    [ReadmeAnyFromPod / ReadmeMdInRoot]
    type     = markdown
    filename = README.md
    location = root

    [MetaNoIndex]
    directory = t
    directory = xt
    directory = eg
    directory = examples
    directory = corpus
    package   = DB
    namespace = t::lib

    ;; set META resources
    [MetaResources]
    homepage        = https://metacpan.org/release/%{dist}
    repository.url  = git://%{github_repopath}.git
    repository.web  = https://%{github_repopath}
    bugtracker.web  = https://%{github_repopath}/issues
    repository.type = git

    ;; add 'provides' to META
    [MetaProvides::Package]
    meta_noindex = 1

    ;; META files
    [MetaYAML]
    [MetaJSON]

    ;; t tests
    [Test::Compile]
    fake_home = 1

    ;; xt tests
    [ExtraTests]
    [MetaTests]
    [PodSyntaxTests]
    [PodCoverageTests]
    [Test::Version]
    [Test::Kwalitee]
    [Test::EOL]
    [Test::NoTabs]

    ;; build
    [MakeMaker]
    [Manifest]

    ;; release
    [ConfirmRelease]
    [UploadToCPAN]

# SYNOPSYS

    # in dist.ini
    [@Author::CHIM]
    dist            = My-Very-Cool-Module
    authority       = cpan:CHIM
    github_username = Wu-Wu
    github_reponame = perl5-My-Very-Cool-Module

# ATTRIBUTES

## dist

The name of the distribution. Required.

## authority

This one is used to set name the CPAN author of the distibution. It should be something like `cpan:PAUSEID`.
Default value is _cpan:CHIM_.

## github\_username

Indicates github.com's account name. Default value is _Wu-Wu_.

## github\_reponame

Indicates github.com's repository name. Default value is set to value of the _dist_\-attribute name.

## fake\_release

Replaces UploadToCPAN with FakeRelease so release won't actually uploaded. Default value is _0_.

# METHODS

## configure

Bundle's configuration for role [Dist::Zilla::Role::PluginBundle::Easy](http://search.cpan.org/perldoc?Dist::Zilla::Role::PluginBundle::Easy).

# SEE ALSO

[Dist::Zilla](http://search.cpan.org/perldoc?Dist::Zilla)

[Dist::Zilla::Role::PluginBundle::Easy](http://search.cpan.org/perldoc?Dist::Zilla::Role::PluginBundle::Easy)

[Dist::Zilla::Plugin::Authority](http://search.cpan.org/perldoc?Dist::Zilla::Plugin::Authority)

# AUTHOR

Anton Gerasimov <chim@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Anton Gerasimov.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
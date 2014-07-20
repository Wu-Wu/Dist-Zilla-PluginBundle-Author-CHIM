# NAME

Dist::Zilla::PluginBundle::Author::CHIM - Dist::Zilla configuration the way CHIM does it

[![Build Status](https://travis-ci.org/Wu-Wu/Dist-Zilla-PluginBundle-Author-CHIM.svg?branch=master)](https://travis-ci.org/Wu-Wu/Dist-Zilla-PluginBundle-Author-CHIM)

# VERSION

version 0.051003

# DESCRIPTION

This is a [Dist::Zilla](https://metacpan.org/pod/Dist::Zilla) PluginBundle. It is roughly equivalent to the
following dist.ini:

    [Git::NextVersion]
    version_regexp = ^([\d._]+)(-TRIAL)?$

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

    [TravisCI::StatusBadge]
    user = %{github.user}
    repo = %{github.repo} || %{dist}
    vector = 1

    [MetaNoIndex]
    directory = t
    directory = xt
    directory = eg
    directory = examples
    directory = corpus
    package   = DB
    namespace = t::lib

    [GithubMeta]
    homepage = https://metacpan.org/release/%{dist}
    remote = origin
    remote = github
    remote = gh
    issues = 1

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

    [Git::Check]
    allow_dirty = dist.ini
    allow_dirty = Changes
    untracked_files = die

    ;; release
    [ConfirmRelease]
    [UploadToCPAN]

    [Git::Commit]
    commit_msg = bump Changes v%v%t [ci skip]

    [Git::Tag]
    tag_format = %v%t
    tag_message = release v%v%t

# SYNOPSYS

    # in dist.ini
    [@Author::CHIM]
    dist            = My-Very-Cool-Module
    authority       = cpan:CHIM
    github.user     = Wu-Wu

# OPTIONS

## -remove

Removes a plugin. Might be used multiple times.

    [@Author::CHIM]
    -remove = PodCoverageTests
    -remove = Test::Kwalitee

## dist

The name of the distribution. Required.

## authority

This one is used to set name the CPAN author of the distibution. It should be something like `cpan:PAUSEID`.
Default value is _cpan:CHIM_.

## github.user

Indicates github.com's account name. Default value is `Wu-Wu`. Used by [Dist::Zilla::Plugin::GithubMeta](https://metacpan.org/pod/Dist::Zilla::Plugin::GithubMeta)
and [Dist::Zilla::Plugin::TravisCI::StatusBadge](https://metacpan.org/pod/Dist::Zilla::Plugin::TravisCI::StatusBadge).

## github.repo

Indicates github.com's repository name. Default value is set to value of the [dist](https://metacpan.org/pod/dist) attribute.
Used by [Dist::Zilla::Plugin::GithubMeta](https://metacpan.org/pod/Dist::Zilla::Plugin::GithubMeta) and [Dist::Zilla::Plugin::TravisCI::StatusBadge](https://metacpan.org/pod/Dist::Zilla::Plugin::TravisCI::StatusBadge).

## fake\_release

Replaces UploadToCPAN with FakeRelease so release won't actually uploaded. Default value is _0_.

## NextRelease.time\_zone

Timezone for entries in **Changes** file. Default value is `UTC`.

See more at [Dist::Zilla::Plugin::NextRelease](https://metacpan.org/pod/Dist::Zilla::Plugin::NextRelease).

## NextRelease.format

Format of entry in _Changes_ file. Default value is `%-7v %{EEE MMM d HH:mm:ss yyyy ZZZ}d`.

See more at [Dist::Zilla::Plugin::NextRelease](https://metacpan.org/pod/Dist::Zilla::Plugin::NextRelease).

## MetaNoIndex.directory

Exclude directories (recursively with files) from indexing by PAUSE/CPAN. Default values:
`t`, `xt`, `eg`, `examples`, `corpus`. Allowed multiple values, e.g.

    MetaNoIndex.directory = foo/bar
    MetaNoIndex.directory = quux/bar/foo

See more at [Dist::Zilla::Plugin::MetaNoIndex](https://metacpan.org/pod/Dist::Zilla::Plugin::MetaNoIndex).

## MetaNoIndex.namespace

Exclude stuff under the namespace from indexing by PAUSE/CPAN. Default values: `t::lib`. Allowed
multiple values, e.g.

    MetaNoIndex.namespace = Foo::Bar
    MetaNoIndex.namespace = Quux::Foo

See more at [Dist::Zilla::Plugin::MetaNoIndex](https://metacpan.org/pod/Dist::Zilla::Plugin::MetaNoIndex).

## MetaNoIndex.package

Exclude the package name from indexing by PAUSE/CPAN. Default values: `DB`. Allowed
multiple values, e.g.

    MetaNoIndex.package = Foo::Bar

See more at [Dist::Zilla::Plugin::MetaNoIndex](https://metacpan.org/pod/Dist::Zilla::Plugin::MetaNoIndex).

## MetaNoIndex.file

Exclude specific filename from indexing by PAUSE/CPAN. No defaults. Allowed
multiple values, e.g.

    MetaNoIndex.file = lib/Foo/Bar.pm

See more at [Dist::Zilla::Plugin::MetaNoIndex](https://metacpan.org/pod/Dist::Zilla::Plugin::MetaNoIndex).

## GatherDir.exclude\_match

Regular expression pattern which causes not to gather matched files. No defaults. Allowed
multiple values, e.g.

    GatherDir.exclude_match = ^foo.*
    GatherDir.exclude_match = ^ba(r|z)\/qux.*

See more at [Dist::Zilla::Plugin::GatherDir](https://metacpan.org/pod/Dist::Zilla::Plugin::GatherDir).

## GitNextVersion.version\_regexp

Regular expression that matches a tag containing a version. Default value is `^([\d._]+)(-TRIAL)?$`.

See more at [Dist::Zilla::Plugin::Git::NextVersion](https://metacpan.org/pod/Dist::Zilla::Plugin::Git::NextVersion).

## GitTag.tag\_format

Format of the tag to apply. Default value is `%v%t`.

See more at [Dist::Zilla::Plugin::Git::Tag](https://metacpan.org/pod/Dist::Zilla::Plugin::Git::Tag).

## GitTag.tag\_message

Format of the tag annotation. Default value is `release v%v%t`.

See more at [Dist::Zilla::Plugin::Git::Tag](https://metacpan.org/pod/Dist::Zilla::Plugin::Git::Tag).

## GitCommit.commit\_msg

The commit message to use in commit after release. Default value is `bump Changes v%v%t [ci skip]`.

See more at [Dist::Zilla::Plugin::Git::Commit](https://metacpan.org/pod/Dist::Zilla::Plugin::Git::Commit).

## GitCheck.allow\_dirty

File that is allowed to have local modifications. This option may appear multiple times. The default
list is `dist.ini` and `Changes`.

See more at [Dist::Zilla::Plugin::Git::Check](https://metacpan.org/pod/Dist::Zilla::Plugin::Git::Check).

## GitCheck.untracked\_files

The commit message to use in commit after release. Default value is `die`.

See more at [Dist::Zilla::Plugin::Git::Check](https://metacpan.org/pod/Dist::Zilla::Plugin::Git::Check).

## GithubMeta.homepage

Homepage of the distribution. Default value is `https://metacpan.org/release/%{dist}`.

See more at [Dist::Zilla::Plugin::GithubMeta](https://metacpan.org/pod/Dist::Zilla::Plugin::GithubMeta).

## GithubMeta.remote

Remote names to inspect for github repository. Default values are `origin`, `github`, `gh`. You can
provide multiple remote names

    [@Author::CHIM]
    GithubMeta.remote = foo
    GithubMeta.remote = bar

See more at [Dist::Zilla::Plugin::GithubMeta](https://metacpan.org/pod/Dist::Zilla::Plugin::GithubMeta).

## GithubMeta.issues

Inserts a bugtracker url to metadata. Default value is `1`.

See more at [Dist::Zilla::Plugin::GithubMeta](https://metacpan.org/pod/Dist::Zilla::Plugin::GithubMeta).

# METHODS

## configure

Bundle's configuration for role [Dist::Zilla::Role::PluginBundle::Easy](https://metacpan.org/pod/Dist::Zilla::Role::PluginBundle::Easy).

# SEE ALSO

[Dist::Zilla](https://metacpan.org/pod/Dist::Zilla)

[Dist::Zilla::Role::PluginBundle::Easy](https://metacpan.org/pod/Dist::Zilla::Role::PluginBundle::Easy)

[Dist::Zilla::Plugin::Authority](https://metacpan.org/pod/Dist::Zilla::Plugin::Authority)

[Dist::Zilla::Plugin::MetaNoIndex](https://metacpan.org/pod/Dist::Zilla::Plugin::MetaNoIndex)

[Dist::Zilla::Plugin::NextRelease](https://metacpan.org/pod/Dist::Zilla::Plugin::NextRelease)

[Dist::Zilla::Plugin::GatherDir](https://metacpan.org/pod/Dist::Zilla::Plugin::GatherDir)

[Dist::Zilla::Plugin::Git](https://metacpan.org/pod/Dist::Zilla::Plugin::Git)

[Dist::Zilla::Plugin::TravisCI::StatusBadge](https://metacpan.org/pod/Dist::Zilla::Plugin::TravisCI::StatusBadge)

[Dist::Zilla::Plugin::GithubMeta](https://metacpan.org/pod/Dist::Zilla::Plugin::GithubMeta)

# AUTHOR

Anton Gerasimov <chim@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Anton Gerasimov.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

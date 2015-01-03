#!/usr/bin/env perl

use strict;
use warnings;

use Test::More 0.96;
use Path::Tiny;

use Test::DZil;

my $corpus = path('corpus/DZ')->absolute;

my $root_config = {
    name                => 'FooBarBaz',
    author              => 'John Doe <john@example.net>',
    license             => 'Perl_5',
    copyright_holder    => 'John Doe',
    copyright_year      => '2014',
};

my $tzil = Builder->from_config(
    {
        dist_root => "$corpus",
    },
    {
        add_files => {
            'source/dist.ini' => dist_ini(
                $root_config,
                [ '@Author::CHIM' => {
                        'dist' => 'FooBarBaz',
                    }
                ]
            ),
        },
    }
);

ok( $tzil->build, 'build dist with @Author::CHIM' );

done_testing;

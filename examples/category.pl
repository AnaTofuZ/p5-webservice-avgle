#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use Data::Dumper;

use WebService::Avgle;

my $avgle = WebService::Avgle->new;

my @categories = $avgle->categories;

print Dumper \@categories;

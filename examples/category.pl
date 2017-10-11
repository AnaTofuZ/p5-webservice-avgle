#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
#use Data::Dumper;
use DDP { deparse => 1 };

use WebService::Avgle;

my $avgle = WebService::Avgle->new;

my $categories = $avgle->get_categories;

p $categories;

use strict;
use warnings;
use utf8;
use Test::More;

use WebService::Avgle;

subtest 'construct' => sub {
    my $avgle = WebService::Avgle->new;

    ok $avgle;
    isa_ok $avgle,'WebService::Avgle';
};

done_testing;

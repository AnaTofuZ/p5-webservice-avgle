use strict;
use warnings;
use utf8;
use Test::More;
use Test::Mock::Guard qw/mock_guard/;

use WebService::Avgle;

subtest 'catergories' => sub {
    my $avgle = WebService::Avgle->new;

    cat_ok $avgle, 'categories';
};

done_testing;

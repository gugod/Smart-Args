use strict;
use warnings;
use args;
use Test::More;
use Test::Exception;

is foo(), 99;
done_testing;
exit;

sub foo {
    my $p;
    args $p => { is => 'Int', default => 99 };
    return $p;
}

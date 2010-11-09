#!perl -w
use strict;
use warnings FATAL => 'all';
use Test::More;
use t::lib::Foo;

is add(x => 1, y => 2), 3;

my $file = quotemeta __FILE__;
my $line;
eval { add( x => 1, y => 2, z => 3 ) }; $line = __LINE__;
like $@, qr/unknown arguments: z at $file line $line/;

eval { add(x => 1) }; $line = __LINE__;
like $@, qr/missing mandatory parameter named '\$y' at $file line $line/;

eval { add(x => 1, y => 'foo') }; $line = __LINE__;
like $@, qr/Validation failed for 'Num' with value foo at $file line $line/;

done_testing;


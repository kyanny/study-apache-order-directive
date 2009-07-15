#!/usr/bin/env perl
use strict;
use warnings;
use LWP::UserAgent;
use Test::Base;
plan tests => 1 * blocks;

my $ua = LWP::UserAgent->new;
run {
    my $block = shift;
    my $res = $ua->get($block->input);
    is $res->code, $block->expected;
}

__END__
===
--- input: http://localhost/order1
--- expected: 200
===
--- input: http://localhost/order2
--- expected: 200
===
--- input: http://localhost/order3
--- expected: 403
===
--- input: http://localhost/order4
--- expected: 200
===
--- input: http://localhost/order5
--- expected: 200
===
--- input: http://localhost/order6
--- expected: 403
===
--- input: http://localhost/order7
--- expected: 200
===
--- input: http://localhost/order8
--- expected: 403
===
--- input: http://localhost/order9
--- expected: 403
===
--- input: http://localhost/order10
--- expected: 403

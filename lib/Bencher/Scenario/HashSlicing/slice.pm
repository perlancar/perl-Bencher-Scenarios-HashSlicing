package Bencher::Scenario::HashSlicing::slice;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark hash slicing',
    participants => [
        {
            module => 'Hash::Util::Pick',
            function => 'pick',
            code_template => 'state $hash = <hash>; state $keys = <keys>; Hash::Util::Pick::pick($hash, @$keys)',
        },
        {
            name => 'map',
            code_template => 'state $hash = <hash>; state $keys = <keys>; +{ map { (exists $hash->{$_} ? ($_ => $hash->{$_}) : ()) } @$keys}',
        },
        {
            name => 'map+grep',
            code_template => 'state $hash = <hash>; state $keys = <keys>; +{ map {$_ => $hash->{$_}} grep { exists $hash->{$_} } @$keys}',
        },
    ],

    datasets => [
        {
            name => 'keys=2, slice=2, exists=1',
            args => { hash=>{1=>1, 2=>1}, keys=>[1, 3] },
        },

        {
            name => 'keys=10, slice=2, exists=1',
            args => { hash=>{map {$_=>1} 1..10}, keys=>[1, 11] },
        },
        {
            name => 'keys=10, slice=10, exists=5',
            args => { hash=>{map {$_=>1} 1..10}, keys=>[1..5, 11..15] },
        },

        {
            name => 'keys=100, slice=2, exists=1',
            args => { hash=>{map {$_=>1} 1..100}, keys=>[1, 101] },
        },
        {
            name => 'keys=100, slice=10, exists=5',
            args => { hash=>{map {$_=>1} 1..100}, keys=>[1..5, 101..105] },
        },
        {
            name => 'keys=100, slice=100, exists=50',
            args => { hash=>{map {$_=>1} 1..100}, keys=>[1..50, 101..150] },
        },

        {
            name => 'keys=1000, slice=2, exists=1',
            args => { hash=>{map {$_=>1} 1..1000}, keys=>[1, 1001] },
        },
        {
            name => 'keys=1000, slice=10, exists=5',
            args => { hash=>{map {$_=>1} 1..1000}, keys=>[1..5, 1001..1005] },
        },
        {
            name => 'keys=1000, slice=100, exists=50',
            args => { hash=>{map {$_=>1} 1..1000}, keys=>[1..50, 1001..1050] },
        },
        {
            name => 'keys=1000, slice=1000, exists=500',
            args => { hash=>{map {$_=>1} 1..1000}, keys=>[1..500, 1001..1500] },
        },

        {
            name => 'keys=10000, slice=2, exists=1',
            args => { hash=>{map {$_=>1} 1..10000}, keys=>[1,10001] },
        },
        {
            name => 'keys=10000, slice=10, exists=5',
            args => { hash=>{map {$_=>1} 1..10000}, keys=>[1..5,10001..10005] },
        },
        {
            name => 'keys=10000, slice=100, exists=50',
            args => { hash=>{map {$_=>1} 1..10000}, keys=>[1..50,10001..10050] },
        },

        {
            name => 'keys=100000, slice=2, exists=1',
            args => { hash=>{map {$_=>1} 1..100000}, keys=>[1,100001] },
        },
    ],
};

1;
# ABSTRACT:

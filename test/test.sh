#!/usr/bin/bash

EXE=$1
TESTDIR=$2

if [ -z "$EXE" ]; then
    echo "Usage: $0 <executable>"
    exit 1
fi

# Test ADD
echo "Testing ADD"
$EXE <test/expr_add.txt | diff -q - $TESTDIR/expr_add_expect.txt

# Test FOUR OPERATIONS
echo "Testing FOUR OPERATIONS"
$EXE <test/expr_fourop.txt | diff -q - $TESTDIR/expr_fourop_expect.txt
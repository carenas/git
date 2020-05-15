#!/bin/sh

test_description="Test synthetic failures"

. ./test-lib.sh

test_expect_success 'succeed' '
	true
'

test_expect_success 'fail' '
	false
'

test_done

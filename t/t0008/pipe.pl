#!/usr/bin/perl

use strict;
use warnings;
use IPC::Open2;

my $pid = open2(my $git_stdout, my $git_stdin,
		"git check-ignore -n -v --stdin");

my $response;
print $git_stdin "one\n";
chomp($response = <$git_stdout>);
exit(1) unless $response =~ m/^\.gitignore:1:one\tone$/;
print $git_stdin "two\n";
chomp($response = <$git_stdout>);
exit(1) unless $response =~ m/^::\ttwo$/;
close($git_stdin);
waitpid $pid, 0;

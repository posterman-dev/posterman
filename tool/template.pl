#!/usr/bin/env perl

sub replace_env {
	return "$ENV{$_[0]}";
}

my $txt = "";
my $in = STDIN;
if(!open($in, "<", $ARGV[0])) {
	die "failed to open the file";
}
while(<$in>) {
	my $line = $_;
	$line =~ s/@([^@]+)@/replace_env($1)/eg;
	$txt = $txt . $line . "\n";
}
print($txt);

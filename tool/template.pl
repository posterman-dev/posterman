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
	if($line =~ /^#<([^>]+)>( .+)?\n$/){
		my $dir = $1;
		my $arg = $2;
		my $og = substr($line, 0, -1);
		if(length($arg) > 0){
			$arg = substr($arg, 1);
		}
		$line = "";
		$line = $line . "### START $og ###\n";
		opendir(my $dh, "$arg");
		while(my $file = readdir($dh)){
			if($file =~ /^\.{1,2}$/){
				next;
			}
			my $obj = $file;
			$obj =~ s/\.c$/\$(OBJ)/;
			$line = $line . "$obj: $arg/$file\n";
			$line = $line . "\t\$(CC) \$@ $arg/$file\n";
		}
		$line = $line . "###  END  $og ###\n";
	}else{
		$line =~ s/@([^@]+)@/replace_env($1)/eg;
	}
	$txt = $txt . $line;
}
print($txt);

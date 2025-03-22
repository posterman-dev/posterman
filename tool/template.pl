#!/usr/bin/env perl

sub replace_env {
	return "$ENV{$_[0]}";
}

my $incr = 0;
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
		if($1 == "DEPRULE"){
			my $objs = "";
			opendir(my $dh, "$arg");
			while(my $file = readdir($dh)){
				if($file =~ /^\.{1,2}$/){
					next;
				}
				if($file =~ /\.c$/){
					my $obj = $file;
					$obj =~ s/\.c$/\$(OBJ)/;
					$objs = $objs . " $obj";
					$line = $line . "$obj: $arg/$file\n";
					$line = $line . "\t\$(CC) \$@ $arg/$file\n";
				}
			}
			closedir($dh);
			$line = $line . "OBJS =$objs\n";
		}
		open(DEPSMK, ">", "out$incr.mk");
		print DEPSMK $line;
		close(DEPSMK);
		$line = "";
		$line = $line . "### START $og ###\n";
		$line = $line . "include out$incr.mk\n";
		$line = $line . "###  END  $og ###\n";
		$incr = $incr + 1;
	}else{
		$line =~ s/@([^@]+)@/replace_env($1)/eg;
	}
	$txt = $txt . $line;
}
print($txt);

#!C:\xampp\perl\bin\perl.exe
#ref: https://www.mediacollege.com/internet/perl/query-string.html

# Example URL:
# http://localhost/perl_example/query_str.pl?topic=intro&heading=1

use strict; use warnings;

print "Content-type: text/html\n\n";
print "Try adding query string at the end of the file name.<br />";

my %in = ();
my $buffer = $ENV{"QUERY_STRING"};

if (length($buffer) > 0) {
	my @pairs = split(/&/, $buffer);
	
	for my $pair (@pairs) {
		my ($key, $value) = split(/=/, $pair);
		$value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/ge;
		$in{$key} = $value;
	}
	
	for my $k (keys %in) {
		print $k . ": " . $in{$k} . "<br />";
	}
}

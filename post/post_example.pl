#!"C:\Strawberry\perl\bin\perl.exe"

use strict;
use warnings;
use 5.32.1;

read(STDIN, my $buffer, $ENV{"CONTENT_LENGTH"});
my @pairs = split(/&/, $buffer);
my %POST = ();

foreach my $pair (@pairs) {
	my ($key, $value) = split(/=/, $pair);
	$value =~ tr/+/ /;
	$value =~ s/%([a-fA-F0-9] [a-fA-F0-9])/pack("C", hex($1))/eg;
	$value =~ s/~!/ ~!/g;
	$POST{$key} = $value;
}

print "Content-type:text/html\r\n\r\n";
print << "HTML";
<html>
<head>
<title>POST Example</title>
</head>

<body>
<h1>POST Contents</h1>
<ul>
HTML

foreach my $key (keys %POST) {
	printf "<li>%s: %s</li>", $key, $POST{$key}
}

print << "HTML";
</ul>
</body>
</html>
HTML



0
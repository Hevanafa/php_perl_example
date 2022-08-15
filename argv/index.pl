#!"C:\Strawberry\perl\bin\perl.exe"
use Data::Dumper "Dumper";

print "Try inputting parameters as well\n";

if (@ARGV) {
    print Dumper \@ARGV;
}

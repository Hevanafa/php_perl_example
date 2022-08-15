# import files relative to this folder
use File::Basename;
use lib dirname (__FILE__);

# your class imports here
use Example;
use ExampleParams;

my $rect = Example->new;
my $rect2 = ExampleParams->new({ width => 2, height => 4 });

printf "\$rect: %d %d\n", $rect->{width}, $rect->{height};
printf "\$rect2: %d", $rect2->getArea;

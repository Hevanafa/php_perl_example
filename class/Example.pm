package Example; # class name

sub new {
    my $class = shift;
    my $self = {
        width => 10,
        height => 5
    };

    return bless $self, $class;
}

1 # return true value
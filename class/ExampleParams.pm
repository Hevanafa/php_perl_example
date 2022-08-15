package ExampleParams; # class name

sub new {
    my ($class, $args) = @_;

    my $self = {
        width => $args->{width} || 1,
        height => $args->{height} || 1
    };

    return bless $self, $class;
}

sub getArea {
    my $this = shift;
    $this->{width} * $this->{height};
}

1 # return true value
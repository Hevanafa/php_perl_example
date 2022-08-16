# this requires Mojolicious
# install with: cpanm Mojolicious

# also make it easier to develop with Mojolicious VSCode extension, which
# supports syntax highlighting for template files

# requires Perl::Tidy to format the code
# install with: cpanm Perl::Tidy

# start with: perl .\index.pl daemon -m production -l http://*:8080
# more information: https://docs.mojolicious.org/Mojolicious/Lite

use Mojolicious::Lite -signatures;

# basic parametrised routing
get "/:foo" => sub ($c) {
    my $foo = $c->param("foo");
    $c->render( text => "Hello from $foo." );
};

# JSON output example with hash reference
get "/questions/:question_id" => sub {
    my $self   = shift;
    my $result = { question_id => int $self->param("question_id") };
    return $self->render( json => $result );
};

get '/' => sub {
    my $self = shift;
    # render templates\index.html.ep
    $self->render( template => 'index' );
};

app->start;

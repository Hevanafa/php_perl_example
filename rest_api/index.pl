# this requires Mojolicious
# install with: cpanm Mojolicious
# start with: perl .\index.pl daemon -m production -l http://*:8080

use Mojolicious::Lite -signatures;

get "/:foo" => sub ($c) {
    my $foo = $c->param("foo");
    $c->render(text => "Hello from $foo.");
};

get '/' => sub ($c) {
  $c->render(template => 'index');
};

app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'Welcome';
<h1>Welcome to the Mojolicious real-time web framework!</h1>

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>

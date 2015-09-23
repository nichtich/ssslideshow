use v5.14;
use Plack::App::EventSource;
use HTTP::Tiny;
use URI::Escape;
use Encode;
use JSON;

my $wiki    = "https://en.wikipedia.org";
my $seconds = 5;

Plack::App::EventSource->new(
    headers => ['Access-Control-Allow-Origin' => '*'],
    handler_cb => sub {
        my ($conn, $env) = @_;
        while(1) {
            my $res = HTTP::Tiny->new->head("${wiki}/wiki/Special:Random");
            my $title = $res->{url};
            $title =~ s{^$wiki/wiki/}{};
            $title =~ s{_}{ }g;
            $title = Encode::decode('utf8',uri_unescape($title));
            my $json = encode_json({ title => $title, url => $res->{url} });
            $conn->push($json);
            sleep $seconds;
        }
        $conn->close;
    },
)->to_app;

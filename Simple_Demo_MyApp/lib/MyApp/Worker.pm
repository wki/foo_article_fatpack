package MyApp::Worker;
use 5.010;
use Moo;

sub work {
    my ($self, $units) = @_;
    
    say "You chose $units units to work";
}

1;

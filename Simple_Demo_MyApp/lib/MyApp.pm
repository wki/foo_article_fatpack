# ABSTRACT: A simple Fatpack Demo
package MyApp;
use Moo;
use MyApp::Worker;
use MooX::Options;

option units => (
    is       => 'ro',
    required => 1,
    format   => 'i',
    short    => 'u',
    doc      => 'Select no of units to work [required]',
);

has worker => (
    is => 'lazy',
);

sub _build_worker { MyApp::Worker->new }

sub run {
    my $self = shift;
    
    $self->worker->work($self->units);
}

1;

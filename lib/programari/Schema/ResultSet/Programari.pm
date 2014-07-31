package programari::Schema::ResultSet::Programari;

use strict;
use warnings;
use base 'DBIx::Class::ResultSet';

sub get_progrmari {
    
    my $self = shift;
    my $etaj = shift;
    
    return $self->all();
    
}

1;
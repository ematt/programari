package programari::Schema::ResultSet::Studenti;

use strict;
use warnings;
use base 'DBIx::Class::ResultSet';


sub full_name {
    my $self = shift;
    
    $self->search(
        {},
        {
            select => [ 'CONCAT(studenti.nume,\' \',studenti.prenume)' ],
            as => 'full_name'
        }
    );
#     return $self->nume.' '.$self->prenume;
}

1;
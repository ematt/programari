package programari::Schema::ResultSet::Studenti;

use strict;
use warnings;
use base 'DBIx::Class::ResultSet';


sub full_name {
        my $self = shift;
        return $self->{nume};
}

1;
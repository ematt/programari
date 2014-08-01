package programari::Schema::ResultSet::Programari;

use strict;
use warnings;
use base 'DBIx::Class::ResultSet';
use programari::Helper::Date qw/ week_monday week_sunday /;

sub this_week {
    
    my $self = shift;
    
#     $c->stash(ye=>'da');

    
    
    return $self->search({
        data => {'between', [
                        week_monday(),
                        week_sunday(),
                            ]
                }
    });

}

sub on_etaj {
    
    my ($self) = shift;
    my $etaj = shift;

    return $self->search({
        etaj => $etaj,
    });

}

1;
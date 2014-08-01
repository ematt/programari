package programari::Schema::ResultSet::Programari;

use strict;
use warnings;
use base 'DBIx::Class::ResultSet';
use DateTime;
use DateTime::Duration;
use DateTime::Format::MySQL;

sub this_week {
    
    my $self = shift;

    my $tmp = DateTime->now();

    my $to_monday = DateTime::Duration->new(
        days => $tmp->day() - $tmp->day_of_week()
    );
    

    my $to_sunday = DateTime::Duration->new(
        days => $tmp->day() + 6 - $tmp->day_of_week()
    );

    my $monday = DateTime->now()->add_duration($to_monday);

    my $sunday = DateTime->now()->add_duration($to_sunday);
    
    return $self->search({
        data => {'between', [
                        DateTime::Format::MySQL->format_date($monday),
                        DateTime::Format::MySQL->format_date($sunday),
                            ]
                }
    });

}

1;
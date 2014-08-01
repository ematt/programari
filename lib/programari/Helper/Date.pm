package programari::Helper::Date;

use strict;

use DateTime;
use DateTime::Duration;
use DateTime::Format::MySQL;

use Exporter 'import';
our @EXPORT_OK = qw/ week_monday week_sunday /;


my $tmp = DateTime->now();


sub week_monday {
    
    my $to_monday = DateTime::Duration->new(
        days => $tmp->day() - $tmp->day_of_week()
    );
    my $monday = DateTime->now()->add_duration($to_monday);
    return DateTime::Format::MySQL->format_date($monday);
}

sub week_sunday {
    
    my $to_sunday = DateTime::Duration->new(
        days => $tmp->day() + 6 - $tmp->day_of_week()
    );

    my $sunday = DateTime->now()->add_duration($to_sunday);

    return DateTime::Format::MySQL->format_date($sunday);
    
}
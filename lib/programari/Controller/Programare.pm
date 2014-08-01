package programari::Controller::Programare;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

programari::Controller::Programare - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub show :Local {
    my ( $self, $c ) = @_;
#     $c->model('DB::Programari')->storage->debug(1);
    my @rezs = [$c->model('DB::Programari')->search(
                    {},{
                    join => 'student',
                    order_by => 'data',
                    select => ['student.nume', 'student.prenume', 'data', 'etaj', 'student.camera id', 
                                ],
                    '+select' =>{CONCAT => "student.nume,\' \',student.prenume",
                                -as => 'full_name'},
#                     as => qw/nume prenume data etaj camera id full_name/,
                    })->this_week()->all()];
    $c->stash(rezs => @rezs);
#     $c->log->debug('rezs:'.$rezs);
    $c->stash(status_msg => "Aici sunt programarile");
    $c->stash(template => 'Programare/show.tt');
}


=encoding utf8

=head1 AUTHOR

Vladut Tuhut,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;

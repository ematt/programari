package programari::Controller::Programare;
use Moose;
use namespace::autoclean;
use programari::Helper::Date qw/week_monday week_sunday/;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

programari::Controller::Programare - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub auto :Private {
    my ( $self, $c ) = @_;

    if(!$c->user_exists()) {
        $c->response->redirect($c->uri_for('/student/login', {error_msg=>"Trebuie sa fi logat"} ) );
        return 0;
    }
    return 1;
}

sub show :Local {
    my ( $self, $c ) = @_;
#     $c->model('DB::Programari')->storage->debug(1);
    
    my $etaj = ($c->request->params->{'etaj'} ? $c->request->params->{'etaj'} : 0); 
#     my $etaj = ($c->request->params->{'etaj'} ? $c->request->params->{'etaj'} : $c->user->get_etaj); 
#     $c->log->debug("sdfdsfdsF");
#     $c->log->debug($c->user->get_etaj,$c->user->camera,$c->user->camera =~ m/(^.)/,($c->request->params->{'etaj'} ? $c->request->params->{'etaj'} : $c->user->get_etaj),$etaj);
#     $c->log->debug("sdfdsfdsF");
    $c->stash(etaj => $etaj);
    
    my @rezs = [$c->model('DB::Programari')->search(
                    {},{
                    join => 'student',
                    order_by => 'data',
                    select => ['student.nume', 'student.prenume', 'data', 'etaj','cod', 'student.camera','student.id','id', 
                                ],
                    '+select' =>{CONCAT => "student.nume,\' \',student.prenume",
                                -as => 'full_name'},
#                     as => qw/nume prenume data etaj camera id full_name/,
                    })->this_week()->on_etaj($etaj)->all()];
    
    
    $c->stash(monday => week_monday(),
              sunday => week_sunday());
    $c->stash(rezs => @rezs);
#     $c->log->debug('rezs:'.$rezs);
#     $c->stash(status_msg => "Aici sunt programarile");
    $c->stash(template => 'Programare/show.tt');
}


sub programeaza :Local {
    my ( $self, $c ) = @_;
    
     
    if ($self->limit_reach($c)) {
        $c->response->redirect($c->uri_for('show', 
                                        {error_msg => "Ati atins limita maxima!", 
                                        etaj => $c->request->params->{'etaj'} }));
        return 0;
    }
    my $status_msg= 'Programare facuta!';
    
    my $programare = $c->model('DB::Programari')->create({
        data => \('CURDATE()+'.$c->request->params->{'zi'}),
        cod => $c->request->params->{'ore'}.$c->request->params->{'zi'},
        etaj => $c->request->params->{'etaj'},
        id_student => $c->user->id,
    });
    
    
    $c->response->redirect($c->uri_for('show', 
                                        {status_msg => $status_msg, etaj => $c->request->params->{'etaj'} }));

}

sub sterge :Local {
    
    my ( $self, $c ) = @_;

    my $del = $c->model('DB::Programari')->search({
        id => $c->request->params->{id},
        id_student => $c->user->id,
    });
    
    $del->delete;

    $c->response->redirect($c->uri_for('show', {
                            etaj => $c->request->params->{'etaj'},
                            }));

}

sub limit_reach {
    
    my ( $self, $c ) = @_;

    my $nr = $c->model('DB::Programari')->search({
                        id_student => $c->user->id,
                    })->this_week()->count;
    return 1 if $nr >= 2;
#     $c->log->debug($c->user->programari->count);
    return 0;

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

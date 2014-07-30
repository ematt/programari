package programari::Controller::student;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

programari::Controller::student - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched programari::Controller::student in student.');
}

sub register :Local {
    
    my ( $self, $c ) = @_;
    
    $c->stash(template => 'student/register.tt');

}

sub register_do :Local :Args(0) {
    
    my ( $self, $c ) = @_;
    
    my $name = $c->request->params->{name} || 'N/A';
    my $name2 = $c->request->params->{name2} || 'N/A';
    
    my $room = $c->request->params->{room} || 0;
    my $pass = $c->request->params->{pass};
    my $pass2= $c->request->params->{pass2};
    
    if($pass ne $pass2) {
        $c->stash(msg => 'Parolele nu coencid.');
        $c->forward('register');
    }
    
    my $student = $c->model('DB::Studenti')->create({
            nume => $name,
            prenume=>$name2,
            camera => $room,
            pass => $pass,
            rol => 'vizitator',
        },
);
    $c->stash(msg => "Inregistrat cu succes!");
    $c->response->redirect(
        $c->uri_for($self->action_for('login'))
    );
    
}

sub login :Local {
    
    
    
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

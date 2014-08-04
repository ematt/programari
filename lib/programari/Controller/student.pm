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
    $c->log->debug($c->request->params);
    $c->log->debug($name2 ne $c->request->params);
    if($pass ne $pass2) {
        $c->log->debug("Nu coiencid");
        $c->stash(error_msg => 'Parolele nu coencid.');
        $c->response->redirect(
            $c->uri_for($self->action_for('register'))
        );
        return 0;
    };
    
    my $student = $c->model('DB::Studenti')->create({
            nume => $name,
            prenume=>$name2,
            camera => $room,
            pass => $pass,
        },
    );
    $c->stash(msg => "Inregistrat cu succes!");
    $c->response->redirect(
        $c->uri_for($self->action_for('login'))
    );
    
}

sub login :Local {};

sub login_do :Local {
    
    my( $self, $c) = @_;
    
    my $name = $c->request->params->{name};
    my $pass = $c->request->params->{pass};
    
#     if($c->model('DB::Studenti')->find({
#         nume => $name,
#         pass => $pass,
#     })) {
#         $c->response->redirect($c->uri_for($self->action_for('login'),
#         {status_msg => "Login cu succes!"}));
#         
#         return 1;
#     } else {
#         $c->response->redirect($c->uri_for($self->action_for('login'),
#         {error_msg => "Combinatia nu a fost gasita"}));
#     }
    if($name && $pass) {
        
        if($c->authenticate({
                nume => $name,
                pass => $pass} )) 
        {
                     $c->response->redirect($c->uri_for($self->action_for('login'),
                    {status_msg => "Login cu succes!"}));
                } else {
                    $c->response->redirect($c->uri_for($self->action_for('login'),
                    {error_msg => "Combinatia nu a fost gasita"}));
                }
    } else {
        $c->response->redirect($c->uri_for($self->action_for('login'),
        {error_msg => "Camp gol!"}));
    }
    
}

sub logout :Local{
    
    my( $self, $c ) = @_;

    $c->logout();

    $c->response->redirect(
            $c->uri_for($self->action_for('login'), 
            {status_msg => "La revedere!"} ));

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

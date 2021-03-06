package programari::Model::DB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'programari::Schema',
    
    connect_info => {
        dsn => 'dbi:mysql:database=programari;host=127.0.0.1',
        user => 'programari',
        password => 'xUrBsdMqBtAcdD3C',
    }
);

=head1 NAME

programari::Model::DB - Catalyst DBIC Schema Model

=head1 SYNOPSIS

See L<programari>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<programari::Schema>

=head1 GENERATED BY

Catalyst::Helper::Model::DBIC::Schema - 0.61

=head1 AUTHOR

Vladut Tuhut

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

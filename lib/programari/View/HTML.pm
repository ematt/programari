package programari::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
    INCLUDE_PATH => [
        programari->path_to('root','src'),
    ],
    TIMER => 0,
    WRAPPER => 'wrapper.tt',
#     DEBUG => 'all',
);

=head1 NAME

programari::View::HTML - TT View for programari

=head1 DESCRIPTION

TT View for programari.

=head1 SEE ALSO

L<programari>

=head1 AUTHOR

Vladut Tuhut,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

use utf8;
package programari::Schema::Result::StudentRoluri;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

programari::Schema::Result::StudentRoluri

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<student_roluri>

=cut

__PACKAGE__->table("student_roluri");

=head1 ACCESSORS

=head2 id_student

  data_type: 'integer'
  is_nullable: 0

=head2 id_rol

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id_student",
  { data_type => "integer", is_nullable => 0 },
  "id_rol",
  { data_type => "integer", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_student>

=item * L</id_rol>

=back

=cut

__PACKAGE__->set_primary_key("id_student", "id_rol");


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-07-30 16:31:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZrWYTD6mZWE1AZkVKMPTjQ

__PACKAGE__->belongs_to(role => 'programari::Schema::Result::Role', 'id_rol');

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;

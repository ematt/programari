use utf8;
package programari::Schema::Result::Studenti;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

programari::Schema::Result::Studenti

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

=head1 TABLE: C<studenti>

=cut

__PACKAGE__->table("studenti");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 nume

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 prenume

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 camera

  data_type: 'smallint'
  is_nullable: 0

=head2 pass

  data_type: 'char'
  is_nullable: 0
  size: 64

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "nume",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "prenume",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "camera",
  { data_type => "smallint", is_nullable => 0 },
  "pass",
  { data_type => "char", is_nullable => 0, size => 64 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-07-30 16:31:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7NU3X+trsD3L+/boRG3zRg

__PACKAGE__->has_many('programari','programari::Schema::Result::Programari','id');
__PACKAGE__->has_many(student_role => 'programari::Schema::Result::StudentRoluri', 'id_student');
__PACKAGE__->many_to_many(roles => 'student_role','role');

# __PACKAGE__->add_columns(
#     "full_name",
#     {data_type => "varchar",
#     is_nullable => 0,
#     size => 255,
# );

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;

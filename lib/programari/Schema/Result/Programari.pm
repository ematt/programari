use utf8;
package programari::Schema::Result::Programari;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

programari::Schema::Result::Programari

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

=head1 TABLE: C<programari>

=cut

__PACKAGE__->table("programari");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 id_student

  data_type: 'integer'
  is_nullable: 0

=head2 data

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 etaj

  data_type: 'tinyint'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "id_student",
  { data_type => "integer", is_nullable => 0 },
  "data",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "etaj",
  { data_type => "tinyint", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-07-31 17:47:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:sHWmI2uJ6r9T58LuWKwrgg

__PACKAGE__->belongs_to('student','programari::Schema::Result::Studenti','id_student');

# __PACKAGE__->add_columns(
#    data => { data_type => 'datetime' }
# );


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;

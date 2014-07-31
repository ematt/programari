use strict;
use warnings;
use Test::More;


use Catalyst::Test 'programari';
use programari::Controller::Programare;

ok( request('/programare')->is_success, 'Request should succeed' );
done_testing();

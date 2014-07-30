use strict;
use warnings;
use Test::More;


use Catalyst::Test 'programari';
use programari::Controller::student;

ok( request('/student')->is_success, 'Request should succeed' );
done_testing();

use strict;
use warnings;

use programari;

my $app = programari->apply_default_middlewares(programari->psgi_app);
$app;


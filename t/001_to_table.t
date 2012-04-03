use strict;
use warnings;
use Test::More tests => 2;
use Text::TabularDisplay::Simple qw(to_table);

my $data = [
    { id => 1, name => 'foo', password => 'secret' },
    { id => 2, name => 'bar', password => 'xxxxxx' },
];

my $columns = [qw/id name/];
my $table = to_table( $data, $columns );
isa_ok $table, 'Text::TabularDisplay';

my $output = <<'T';
+----+------+
| id | name |
+----+------+
| 1  | foo  |
| 2  | bar  |
+----+------+
T
chomp $output;
is $table->render, $output, 'output ok';

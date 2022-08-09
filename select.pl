# ref: https://www.mysqltutorial.org/perl-mysql/perl-mysql-select/
# use MOCK_DATA.sql as the sample data

use strict; use warnings;
use DBI;

# database name
my $dsn = "DBI:mysql:test";
my $username = "root";
my $password = "";

my %attr = qw(PrintError 0 RaiseError 1);

# database handle
my $dbh = DBI->connect($dsn, $username, $password, \%attr);

sub query_users {
    my ($dbh) = shift;
    my $sql = "SELECT first_name, last_name FROM `mock_data` LIMIT 10";
    my $sth = $dbh->prepare($sql);

    $sth->execute();

    while (my @row = $sth->fetchrow_array()) {
        my ($first, $last) = @row;
        printf("%s %s\n", $first, $last);
    }

    $sth->finish();
}

query_users($dbh);

$dbh->disconnect();
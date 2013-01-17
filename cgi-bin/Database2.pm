package Database2;
use DBI;
use CGI;
use Data::Dumper;
my ($dbh, $sth, $rows);
sub connect
{
    my $dsn = "DBI:mysql:database=test_lutao;host=localhost";
    my $username = "root";
    my $password = "111111";
    $dbh = DBI->connect($dsn, $username, $password, {RaiseError=>1, PrintError=>0});
    return $dbh;
}
sub insert
{
    my @list = @_;
    $dbh = &connect();
    $rows = $dbh->do(qq{truncate table Catalog});
    foreach (@list)
    {
        $_ = $dbh->quote("$_");
        $rows = $dbh->do(qq{insert into Catalog(name) values($_)});
    }#所有的数据至此全部插入了数据库表中
    $dbh->disconnect();
}
sub select
{
    $dbh = &connect();
    $sth = $dbh->prepare("select * from Catalog");
    $sth->execute();
    my @list_items;
    while(my $ary_ref = $sth->fetchrow_arrayref())
    {
        push (@list_items, $ary_ref);
    }
    $sth->finish();
    $dbh->disconnect();
    return @list_items;
}
return 1;

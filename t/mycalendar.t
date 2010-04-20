use Test::More;
use Schedule::API::Calendar;

my @days = Schedule::API::Calendar->seven_days('2010', '4', '20');
my @expected = (20, 21, 22, 23, 24, 25, 26, 27);
for (0..6) {
    is $days[$_], $expected[$_], 'sevendays'; 
}

@days = Schedule::API::Calendar->days_of_month('2010', '4', '20');
for (0..29) {
    is $days[$_], ++$_, 'sevendays'; 
}

done_testing;

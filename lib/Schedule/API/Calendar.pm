package Schedule::API::Calendar;

use strict;
use warnings;
use DateTime;
use DateTime::Event::Recurrence;
use Data::Dumper;

sub seven_days {
    my ($class, $year, $month, $day) = @_;

    my $dt = $class->_instance($year, $month, $day);
    my $daily = DateTime::Event::Recurrence->daily;
    $daily->set_time_zone('Asia/Tokyo');
    my $dt_7 = $dt->clone;
    $dt_7->add(days => 7);
    my @days = $daily->as_list(start => $dt, end => $dt_7);
    @days = map { $_->day } @days;
    return @days;
}

sub days_of_month {
    my ($class, $year, $month, $day) = @_;

    my $dt = $class->_instance($year, $month, $day);
    $dt->set_day(1);
    my $daily = DateTime::Event::Recurrence->daily;
    $daily->set_time_zone('Asia/Tokyo');
    my @days = $daily->as_list(
        start => $dt,
        end => DateTime->last_day_of_month(year => $dt->year, month => $dt->month,));
    warn DateTime->last_day_of_month(year => $dt->year, month => $dt->month,);
    @days = map { $_->day } @days;
    return @days;
}

sub _instance {
    my ($class, $year, $month, $day) = @_;

    my $dt;
    if ($year && $month && $day) {
        $dt = DateTime->new(year => $year, month => $month, day => $day, time_zone => 'Asia/Tokyo');
    }
    else {
        $dt = DateTime->now;
    }
    return $dt;
}

1;

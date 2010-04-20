package Schedule::Calendar;

use strict;
use warnings;

use base 'Mojolicious::Controller';
use Schedule::API::Calendar;

sub render_week {
    my $self = shift;

    my @days = Schedule::API::Calendar->seven_days;

    $self->render(days => [@days]);
}

sub render_month {
    my $self = shift;

    my @days = Schedule::API::Calendar->days_of_month;

    $self->render(days => [@days]);
}

1;

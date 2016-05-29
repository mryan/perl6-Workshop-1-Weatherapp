use Test::When <online>;
use Test;
use WebService::Weather;

for ('London'), ('London', 'ca') -> $args {
    subtest {
        my $result = weather-for |$args;

        isa-ok $result, 'WebService::Weather::Result',
            'result is of a correct data type';

        does-ok $result."$_"(), Numeric, "$_ is numerical"
            for <temp wind precip>;

        cmp-ok $result.temp,   &[<],  70,   'temperature is not too high';
        cmp-ok $result.temp,   &[>],  -100, 'temperature is not too low';
        cmp-ok $result.wind,   &[<],  120,  'wind speed is not too high';
        cmp-ok $result.wind,   &[>=], 0,    'wind speed is not too low';
        cmp-ok $result.precip, &[<],  3200, 'precipitation is not too high';
        cmp-ok $result.precip, &[>=], 0,    'precipitation is not too low';
    }, "Testing with args: $args";
}

isa-ok weather-for('blargs' x 12), Failure,
    'we get a Failure for unknown city';

done-testing;

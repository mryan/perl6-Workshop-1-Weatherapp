unit module WebService::Weather;

class WebService::Weather::Result {
    has $.temp ;
}

sub weather-for($city , $country) is export {
    return WebService::Weather::Result.new( :temp(25) );
}

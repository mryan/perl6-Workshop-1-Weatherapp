unit module WebService::Weather;

class Result {
    has $.temp ;
}

sub weather-for($city , $country? ) is export {
    return Result.new( :temp(25) );
}

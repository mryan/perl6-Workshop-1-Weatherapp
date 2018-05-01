
class WebService::Weather::Result {
    has $.temp ;
}

sub weather-for($city , $country? ) {
    return WebService::Weather::Result.new( :temp(25) );
}

sub EXPORT() {
    return %(
        '&weather-for'  =>  &weather-for
    )
}

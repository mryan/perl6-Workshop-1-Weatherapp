our $API-KEY ;

class WebService::Weather::Result {
    has $.temp ;
}

sub weather-for($city , $country? ) {
    say "# $API-KEY";
    return WebService::Weather::Result.new( :temp(25) );
}

sub EXPORT($api-key) {
    # Peform some validation of $api-key, then...
    $API-KEY = $api-key ;

    return %(
        '&weather-for'  =>  &weather-for
    )
}



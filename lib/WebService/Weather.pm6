unit module WebService::Weather;
my $API-KEY;

class Result {
    has $.temp ;
    has $.wind ;
    has $.precip ;
}

sub weather-for($city , $country? , :$api-key) is export {
    $API-KEY = $api-key if defined $api-key ;
    return fail "No API key provided!" unless defined $API-KEY ;
    say "# $API-KEY" ;
    
    return Result.new: :temp(25) , :wind(35) , :precip(20)
}

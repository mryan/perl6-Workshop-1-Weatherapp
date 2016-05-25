# PURPOSE

Provide basic information on the current weather for a specified location.
The information must be available for as many countries as possible and
needs to include temperature, possibility of precipitation, wind
speed, humidex, and windchill. The information is to be provided
for the current day only (no hourly or multi-day forecasts).

# GENERAL OUTLINE

The implementation is a module that provides a function to retrieve
weather information. Currently supported service
is [OpenWeatherMap](www.openweathermap.org), but the implementation
must allow for easy replacement of services.

# INTERFACE DETAILS

## EXPORTED SUBROUTINES

### `weather-for`

    my $result = weather-for 'Brampton', 'ca';

    printf "Current weather is: %d℃, %dmm precip/3hr, wind %dm/s\n",
        .temp, .precip, .wind given $result;

Takes two positional arguments—name of the city and [ISO country
code](http://www.nationsonline.org/oneworld/country_code_list.htm)—to
provide weather information for. The country is optional and by default is
not specified.

Returns a `Weather::Result` object on success, otherwise returns
a `Failure`. The object provides these methods:

#### `.temp`

    say "Current temperature is $result.temp()℃"

Takes no arguments. Returns the `Numeric` temperature in degrees Celcius.

#### `.precip`

    say "Expected to receive $result.precip()mm/3hr of percipitation";

Takes no arguments. Returns the `Numeric` amount of precipitation in
millimeters per three hours.

#### `.wind`

    say "Wind speed is $result.wind()m/s";

Takes no arguments. Returns the `Numeric` wind speed in meters per second.

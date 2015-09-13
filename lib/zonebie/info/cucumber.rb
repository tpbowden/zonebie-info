require 'zonebie/info'

Zonebie.set_timezone_with_info

at_exit do
  Zonebie.print_timezone_info
end

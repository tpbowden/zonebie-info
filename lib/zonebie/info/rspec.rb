require 'zonebie/info'

RSpec.configure do |c|
  c.before(:suite) do
    Zonebie.set_timezone_with_info
  end
  c.after(:suite) do
    Zonebie.print_timezone_info
  end
end

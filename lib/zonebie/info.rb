require 'zonebie'
require 'wikipedia'

module Zonebie
  class << self
    def set_timezone_with_info
      set_random_timezone
      load_from_wikipedia(::Time.zone.name)
    end

    def load_from_wikipedia(zone)
      @request = Thread.new do
        download_summary(zone)
      end
    end

    def print_timezone_info
      case @request
      when nil
        $stderr.puts '', 'Please set the ZONEBIE_INFO environment variable to load data from Wikipedia'
      else
        $stdout.puts '', @request.join.value
      end
    end

    private

    def download_summary(zone)
      text = Wikipedia.find(zone).text
      if text
        text.split("\n").first
      else
        "No information available for #{zone}"
      end
    end
  end
end

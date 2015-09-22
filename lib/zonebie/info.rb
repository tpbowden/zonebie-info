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
        begin
          download_summary(zone)
        rescue StandardError
          'Request to wikipedia failed, please check your network connection and try again later'
        end
      end
    end

    def print_timezone_info
      if @request.nil?
        $stderr.puts '', 'Please set a timezone before printing the info'
      else
        if @request.alive?
          $stderr.puts '', 'Wikipedia download did not complete in time, please check your network connection and try again later'
        else
          $stdout.puts '', @request.join.value
        end
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

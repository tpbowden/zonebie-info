require 'spec_helper'
require 'zonebie/info'

describe Zonebie do
  let(:page) { double :page }

  before do
    allow(Wikipedia).to receive(:find).and_return page
  end

  describe '.load_from_wikipedia' do
    context 'when there is info on the timezone' do
      let(:expected) do
        'Some information about a timezone'
      end

      before do
        allow(page).to receive(:text).and_return "Some information about a timezone\npara 2\n"
      end

      it 'uses a new thread to request data from wikipedia and returns the first paragraph' do
        result = Zonebie.load_from_wikipedia 'a timezone'
        expect(result.join.value).to eq expected
      end
    end

    context 'when there is no info on the timezone' do
      let(:expected) do
        'No information available for a timezone'
      end

      before do
        allow(page).to receive(:text).and_return nil
      end

      it 'informs that there was no information' do
        result = Zonebie.load_from_wikipedia 'a timezone'
        expect(result.join.value).to eq expected
      end
    end
  end

  describe '.print_timezone_info' do
    let(:out) { StringIO.new }

    context 'when the request is nil' do
      let(:message) do
        'Please set the ZONEBIE_INFO environment variable to load data from Wikipedia'
      end

      before do
        Zonebie.instance_variable_set('@request', nil)
        $stderr = out
      end

      after do
        $stderr = STDERR
      end

      it 'informs the user to set the ZONEBIE_INFO variable' do
        Zonebie.print_timezone_info
        out.rewind
        expect(out.read).to eq "\n#{message}\n"
      end
    end

    context 'when the request succeeds' do
      let(:t) { Thread.new { 'hello' } }

      before do
        Zonebie.instance_variable_set '@request', t
        $stdout = out
      end

      after do
        $stdout = STDOUT
      end

      it 'prints the info from wikipedia' do
        Zonebie.print_timezone_info
        out.rewind
        expect(out.read).to eq "\nhello\n"
      end
    end
  end
end

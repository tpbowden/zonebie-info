require 'spec_helper'
require 'zonebie/info'

describe '#print_timezone_info' do
  let(:content) { "some wiki info\nsecond paragraph" }
  let(:expected) { "\nsome wiki info\n" }
  let(:page) { double :page }
  let(:out) { StringIO.new }

  before do
    allow($stdout).to receive(:puts)
    allow(Wikipedia).to receive(:find).and_return page
    allow(page).to receive(:text).and_return content
    ENV['ZONEBIE_INFO'] = 'true'
    Zonebie.set_timezone_with_info
    $stdout = out
  end

  after do
    $stdout = STDOUT
  end

  it 'prints info about the time zone to stdout' do
    sleep 0.01
    Zonebie.print_timezone_info
    out.rewind
    expect(out.read).to eq expected
  end
end

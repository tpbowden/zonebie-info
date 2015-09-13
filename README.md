# Zonebie Info [![Build Status](https://travis-ci.org/tpbowden/zonebie-info.svg)](https://travis-ci.org/tpbowden/zonebie-info)

Zonebie plugin that prints details of the random timezone (if available)

## Installation

    gem "zonebie-info"

## Usage

### RSpec

In `spec_helper.rb`:

    require 'zonebie/info/rspec'

### Cucumber

In `env.rb`

    require 'zonebie/info/cucumber'

### Manual Setup

`zonebie-info` depends on Zonebie so all you have to do is replace calls to `Zonebie.set_random_timezone` with:

    Zonebie.set_timezone_with_info

Then, after your tests have run, you need to call `Zonebie.print_timezone_info` in the after hook

Data is collected in a separate thread so shouldn't slow down your tests by too
much.

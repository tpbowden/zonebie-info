# Zonebie Info [![Build Status](https://travis-ci.org/tpbowden/zonebie-info.svg)](https://travis-ci.org/tpbowden/zonebie-info)

Zonebie plugin that prints details of the random timezone where available

## Installation

    gem "zonebie-info"

## Usage

`zonebie-info` depends on Zonebie so all you have to do is replace calls to Zonebie with:

    require "zonebie/info"

    Zonebie.set_timezone_with_info

Then, after your tests have run, you need to call `Zonebie.print_timezone_info` in the after hook

Data is collected in a separate thread so shouldn't slow down your tests by too
much.

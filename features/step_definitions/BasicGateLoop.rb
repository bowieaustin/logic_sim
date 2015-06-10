#!/usr/bin/env ruby

require_relative "../../lib/gates.rb"

gate1 = nil
gate2 = nil

Given /that I have 2 And gates hooked up to eachother/ do
    gate1 = And.new
    gate2 = And.new
    gate1.inputs = [0,gate2]
    gate2.inputs = [1, gate1]
end

When /I evaluate them/ do
    gate1.evaluate
end

Then /they should evaluate correctly/ do
    gate1.evaluate == 0
end

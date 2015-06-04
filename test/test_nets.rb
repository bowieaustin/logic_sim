#!/usr/bin/env ruby

require_relative "../lib/net"
require "test/unit"

class TestNets < Test::Unit::TestCase
	
	def test_eval
		and_gate = And.new
        net = Net.new
        net.set_driver and_gate
        and_gate.inputs.concat([1, 1])
        assert_equal(net.get_value, 1)
	end
end

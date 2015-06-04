#!/usr/bin/env ruby

require_relative "../lib/gates"
require_relative "../lib/net"
require "test/unit"


class TestBasicDesign<Test::Unit::TestCase

    def test_basic_design1
        gate1 = And.new
        gate2 = And.new
        gate3 = Or.new
        net1 = Net.new
        net2 = Net.new
        gate1.inputs = [0,1]
        gate2.inputs = [1,1]
        net1.set_driver gate1
        net2.set_driver gate2
        net1.add_load gate3
        net2.add_load gate3
        assert_equal(gate1.evaluate, 0)
        assert_equal(gate2.evaluate, 1)
        assert_equal(net1.evaluate, 0)
        assert_equal(net2.evaluate, 1)
        assert_equal(gate3.evaluate, 1)
    end
end
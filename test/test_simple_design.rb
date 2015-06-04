#!/usr/bin/env ruby

require_relative "../lib/gates"
require "test/unit"

class TestBasicDesign<Test::Unit::TestCase

    def test_basic_design1
        gate1 = And.new
        gate2 = And.new
        gate3 = Or.new
        gate1.inputs = [0,1]
        gate2.inputs = [1,1]
        assert_equal(gate1.evaluate, 0)
        assert_equal(gate2.evaluate, 1)
        assert_equal(gate3.evaluate, 1)
    end

    def test_basic_design2
        gate1 = Or.new
        gate2 = Xnor.new
        gate3 = Not.new
        gate4 = Nand.new
        gate4.inputs = [gate1, gate2, gate3]
        gate4.inputs.push(1)
        gate1.inputs = [0, 1]
        gate2.inputs = [1, 0, 1]
        gate3.inputs = [0]
        assert_equal(0, gate4.evaluate)
end

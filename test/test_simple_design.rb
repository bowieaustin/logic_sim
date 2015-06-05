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
        gate3.inputs = [gate1, gate2]
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
        gate4.add_input 1
        gate1.inputs = [0, 1]
        gate2.inputs = [1, 0, 1]
        gate3.inputs = [0]
        assert_equal(0, gate4.evaluate)
    end

    def test_basic_design3
        gate1 = And.new
        gate2 = Nand.new
        gate3 = Nor.new
        gate4 = Not.new
        gate5 = And.new
        gate6 = Xor.new
        gate1.inputs = [0, 1]
        gate2.inputs = [1, 1]
        gate3.inputs = [0, gate1]
        gate4.inputs = [gate2]
        gate5.inputs = [gate4,gate1]
        gate6.inputs = [gate5, gate3]
        assert_equal(1, gate6.evaluate)
    end

    def test_inf_loop1
        gate1 = And.new
        gate2 = Nand.new
        gate1.inputs = [1, gate2]
        gate2.inputs = [0, gate1]
        assert_equal(1, gate1.evaluate)
    end
end

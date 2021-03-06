#!/usr/bin/env ruby

require_relative "../lib/gates"
require "test/unit"

class TestGates < Test::Unit::TestCase

    def test_And_Gate
        and_gate = And.new
        and_gate.inputs = [0,1]
        assert_equal(and_gate.evaluate, 0)
        and_gate.inputs = [0,0]
        assert_equal(and_gate.evaluate, 0)
        and_gate.inputs = [1,1]
        assert_equal(and_gate.evaluate, 1)
        and_gate.inputs = [1, 1, 1, 1]
        assert_equal(and_gate.evaluate, 1)
    end

    def test_Nand_Gate
        nand_gate = Nand.new
        nand_gate.inputs = [0,1]
        assert_equal(nand_gate.evaluate, 1)
        nand_gate.inputs = [0,0]
        assert_equal(nand_gate.evaluate, 1)
        nand_gate.inputs = [1,1]
        assert_equal(nand_gate.evaluate, 0)
        nand_gate.inputs = [1, 1, 1, 1]
        assert_equal(nand_gate.evaluate, 0)
    end

    def test_Or_Gate
        or_gate = Or.new
        or_gate.inputs = [0, 1]
        assert_equal(or_gate.evaluate, 1)
        or_gate.inputs = [0, 0]
        assert_equal(or_gate.evaluate , 0)
        or_gate.inputs = [0, 0, 0, 1]
        assert_equal(or_gate.evaluate, 1)
    end

    def test_Nor_Gate
        nor_gate = Nor.new
        nor_gate.inputs = [0, 1]
        assert_equal(nor_gate.evaluate, 0)
        nor_gate.inputs = [0, 0]
        assert_equal(nor_gate.evaluate , 1)
        nor_gate.inputs = [0, 0, 0, 1]
        assert_equal(nor_gate.evaluate, 0)
    end

    def test_Xor_Gate
        xor_gate = Xor.new
        xor_gate.inputs = [0, 0]
        assert_equal(xor_gate.evaluate, 0)
        xor_gate.inputs = [1, 1]
        assert_equal(xor_gate.evaluate, 0)
        xor_gate.inputs = [0, 1]
        assert_equal(xor_gate.evaluate, 1)
        xor_gate.inputs = [0, 1, 1, 1, 0]
        assert_equal(xor_gate.evaluate, 1)
        xor_gate.inputs = [0, 0, 1, 1, 1, 0]
        assert_equal(xor_gate.evaluate, 1)
    end

    def test_Xnor_Gate
        xnor_gate = Xnor.new
        xnor_gate.inputs = [0, 0]
        assert_equal(xnor_gate.evaluate, 1)
        xnor_gate.inputs = [1, 1]
        assert_equal(xnor_gate.evaluate, 1)
        xnor_gate.inputs = [0, 1]
        assert_equal(xnor_gate.evaluate, 0)
        xnor_gate.inputs = [0, 1, 1, 1, 0]
        assert_equal(xnor_gate.evaluate, 0)
        xnor_gate.inputs = [0, 0, 1, 1, 1, 0]
        assert_equal(xnor_gate.evaluate, 0)
    end

    def test_Not_Gate
        not_gate = Not.new
        not_gate.inputs = [0]
        assert_equal(not_gate.evaluate, 1)
        not_gate.inputs = [1]
        assert_equal(not_gate.evaluate, 0)
    end
    
    def test_exceptions
        gates = [And.new,Nand.new,Or.new,Nor.new,Xor.new,Xnor.new,Not.new]
        gates.each do |gate|
            assert_raise(RuntimeError){gate.evaluate}
        end
    end 
end

class TestPointers < Test::Unit::TestCase

    def test_different_input_arrays
        and_gate = And.new
        nand_gate = Nand.new
        and_gate.inputs.concat([1,1])
        assert_raise(RuntimeError){nand_gate.evaluate}
        assert_equal(and_gate.evaluate, 1)
        assert_raise(RuntimeError){And.new.evaluate}
    end
end

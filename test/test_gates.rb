#!/usr/bin/env ruby

require_relative "../lib/gates"
require "test/unit"

class TestGates < Test::Unit::TestCase

    def test_And_Gate
        and_gate = And.new
        and_gate.inputs = [0,1]
        assert_equal(and_gate.eval, 0)
        and_gate.inputs = [0,0]
        assert_equal(and_gate.eval, 0)
        and_gate.inputs = [1,1]
        assert_equal(and_gate.eval, 1)
        and_gate.inputs = [1, 1, 1, 1]
        assert_equal(and_gate.eval, 1)
    end

    def test_Nand_Gate
        nand_gate = Nand.new
        nand_gate.inputs = [0,1]
        assert_equal(nand_gate.eval, 1)
        nand_gate.inputs = [0,0]
        assert_equal(nand_gate.eval, 1)
        nand_gate.inputs = [1,1]
        assert_equal(nand_gate.eval, 0)
        nand_gate.inputs = [1, 1, 1, 1]
        assert_equal(nand_gate.eval, 0)
    end

    def test_Or_Gate
        or_gate = Or.new
        or_gate.inputs = [0, 1]
        assert_equal(or_gate.eval, 1)
        or_gate.inputs = [0, 0]
        assert_equal(or_gate.eval , 0)
        or_gate.inputs = [0, 0, 0, 1]
        assert_equal(or_gate.eval, 1)
    end

    def test_Nor_Gate
        nor_gate = Nor.new
        nor_gate.inputs = [0, 1]
        assert_equal(nor_gate.eval, 0)
        nor_gate.inputs = [0, 0]
        assert_equal(nor_gate.eval , 1)
        nor_gate.inputs = [0, 0, 0, 1]
        assert_equal(nor_gate.eval, 0)
    end

    def test_Xor_Gate
        xor_gate = Xor.new
        xor_gate.inputs = [0, 0]
        assert_equal(xor_gate.eval, 0)
        xor_gate.inputs = [1, 1]
        assert_equal(xor_gate.eval, 0)
        xor_gate.inputs = [0, 1]
        assert_equal(xor_gate.eval, 1)
        xor_gate.inputs = [0, 1, 1, 1, 0]
        assert_equal(xor_gate.eval, 0)
        xor_gate.inputs = [0, 0, 1, 1, 1, 0]
        assert_equal(xor_gate.eval, 1)
    end

    def test_Xnor_Gate
        xnor_gate = Xnor.new
        xnor_gate.inputs = [0, 0]
        assert_equal(xnor_gate.eval, 1)
        xnor_gate.inputs = [1, 1]
        assert_equal(xnor_gate.eval, 1)
        xnor_gate.inputs = [0, 1]
        assert_equal(xnor_gate.eval, 0)
        xnor_gate.inputs = [0, 1, 1, 1, 0]
        assert_equal(xnor_gate.eval, 1)
        xnor_gate.inputs = [0, 0, 1, 1, 1, 0]
        assert_equal(xnor_gate.eval, 0)
    end

    def test_Not_Gate
        not_gate = Not.new
        not_gate.inputs = [0]
        assert_equal(not_gate.eval, 1)
        not_gate.inputs = [1]
        assert_equal(not_gate.eval, 0)
    end
end
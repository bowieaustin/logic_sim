#!/usr/bin/env ruby

require_relative "../lib/DigitalLogic"
require "test/unit"

class TestGates < Test::Unit::TestCase
    
    include DigitalLogic::Operators

    def test_And_Gate
        assert_equal(true, And([true,true]))
        assert_equal(false, And([false,true]))
        assert_equal(true, And([true,true,true]))
        assert_equal(false, And([true,true,false]))
    end

    def test_Nand_Gate
        assert_equal(false, Nand([true, true]))
        assert_equal(true, Nand([false, true]))
        assert_equal(true, Nand([false, false]))
        assert_equal(true, Nand([true, false, true, true, true, false]))
        assert_equal(false, Nand([true, true, true, true, true]))
    end

    def test
end


#!/usr/bin/env ruby

require_relative "../lib/DigitalLogic"
require "test/unit"

class TestGates < Test::Unit::TestCase
    
    include DigitalLogic::Operators

    def test_And_Gate
        assert_equal(1, And([1,1]))
        assert_equal(0, And([0,1]))
        assert_equal(1, And([1,1,1]))
        assert_equal(0, And([1,1,0]))
        assert_equal(0, And([1]))
    end
end


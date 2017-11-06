#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/pride'
require 'minitest/autorun'
require_relative 'hamming'

class HammingTest < Minitest::Test

  def test_empty_strands
    assert_equal 0, Hamming.compute_distance('', '')
  end

  def test_disallow_first_strand_longer

    assert_raises(ArgumentError) { Hamming.compute_distance('AATG', 'AAA') }
  end

  def test_identical_strands
    assert_equal 0, Hamming.compute_distance('B', 'B')
  end

  def test_long_identical_strands

    assert_equal 0, Hamming.compute_distance('GGACTGA', 'GGACTGA')
  end

  def test_complete_distance_in_single_nucleotide_strands

    assert_equal 1, Hamming.compute_distance('A', 'G')
  end


  def test_complete_distance_in_small_strands

    assert_equal 2, Hamming.compute_distance('AG', 'CT')
  end


  def test_small_distance

    assert_equal 1, Hamming.compute_distance('GGACG', 'GGTCG')
  end

  def test_small_distance_in_long_strands

    assert_equal 2, Hamming.compute_distance('ACCAGGG', 'ACTATGG')
  end

  def test_non_unique_character_in_first_strand

    assert_equal 1, Hamming.compute_distance('AGA', 'AGG')
  end


  def test_large_distance

    assert_equal 4, Hamming.compute_distance('GATACA', 'GCATAA')
  end

  def test_large_distance_in_off_by_one_strand

    assert_equal 9, Hamming.compute_distance('GGACGGATTCTG', 'AGGACGGATTCT')
  end

end

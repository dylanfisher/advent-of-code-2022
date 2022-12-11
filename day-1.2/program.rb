#!/usr/bin/env ruby

# Day 1: Calorie Counting
# Part Two
# https://adventofcode.com/2022/day/1

require 'pry'

lines = File.readlines('input.txt').collect(&:chomp)
groups = [[]]

lines.each do |line|
  groups << [] if line == ''
  groups.last << line
end

summed_groups = []
groups.each_with_index { |g, i| summed_groups << g.collect(&:to_i).sum }
summed_groups = Hash[(0...summed_groups.size).zip summed_groups]
summed_groups = summed_groups.sort_by { |_k, v| v }

largest_3 = summed_groups.last(3)

weight = largest_3.collect { |x| x[1] }.sum

puts "weight #{weight}"

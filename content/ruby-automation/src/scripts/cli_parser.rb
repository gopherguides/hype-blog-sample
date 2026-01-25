#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'
require 'ostruct'

class CLI
  def self.parse(args)
    options = OpenStruct.new(
      verbose: false,
      output: 'output.txt',
      format: 'text'
    )

    parser = OptionParser.new do |opts|
      opts.banner = "Usage: #{$PROGRAM_NAME} [options] FILE..."

      opts.on('-v', '--verbose', 'Enable verbose output') do
        options.verbose = true
      end

      opts.on('-o', '--output FILE', 'Output file (default: output.txt)') do |file|
        options.output = file
      end

      opts.on('-f', '--format FORMAT', %w[text json csv],
              'Output format (text, json, csv)') do |format|
        options.format = format
      end

      opts.on('-h', '--help', 'Show this help message') do
        puts opts
        exit
      end
    end

    parser.parse!(args)
    options.files = args

    if options.files.empty?
      warn 'Error: No input files specified'
      warn parser
      exit 1
    end

    options
  end
end

# Usage
if __FILE__ == $PROGRAM_NAME
  options = CLI.parse(ARGV)

  puts "Verbose: #{options.verbose}"
  puts "Output: #{options.output}"
  puts "Format: #{options.format}"
  puts "Files: #{options.files.join(', ')}"
end

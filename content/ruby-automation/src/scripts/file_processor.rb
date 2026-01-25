#!/usr/bin/env ruby
# frozen_string_literal: true

require 'fileutils'
require 'time'

class FileProcessor
  def initialize(input_dir, output_dir)
    @input_dir = input_dir
    @output_dir = output_dir
    FileUtils.mkdir_p(@output_dir)
  end

  def process_logs
    log_files = Dir.glob(File.join(@input_dir, '*.log'))

    log_files.each do |file|
      puts "Processing: #{file}"
      process_file(file)
    end

    puts "Processed #{log_files.count} files"
  end

  private

  def process_file(path)
    filename = File.basename(path)
    output_path = File.join(@output_dir, "processed_#{filename}")

    File.open(output_path, 'w') do |out|
      File.foreach(path) do |line|
        next if line.strip.empty?

        # Add timestamp and filter errors
        if line.include?('ERROR')
          out.puts "[#{Time.now.iso8601}] #{line}"
        end
      end
    end
  end
end

# Usage
if __FILE__ == $PROGRAM_NAME
  processor = FileProcessor.new('./logs', './output')
  processor.process_logs
end

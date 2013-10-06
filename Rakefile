# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'

require_relative 'lib/word_scanners'

WORD_LIST_PATH = File.join(File.dirname(__FILE__), "WordList.txt")

module TaskHelpers
  def word_list_path
    WORD_LIST_PATH
  end

  def with_running_time(&block)
    start_time = Time.now
    block.call()
    Time.now - start_time
  end

  def word_list_dictionary
    File.read(word_list_path).split("\r\n")
  end

  def run_scanner(scanner)
    result = nil
    dictionary = TaskHelpers.word_list_dictionary

    time = with_running_time do
      result = scanner.scan(dictionary)
    end     
    
    formatted_result = ::WordScanners::FormatingProcessor.process(result)
    puts formatted_result.join("\n")

    puts "\nRunning time: #{time} seconds"
  end

end

namespace :scanner do
  
  include TaskHelpers

  desc "run readable scanner"
  task :readable do
    scanner = ::WordScanners::ReadableScanner.new
    run_scanner(scanner)
  end

  desc "run fast scanner"
  task :fast do
    scanner = ::WordScanners::FastScanner.new
    run_scanner(scanner)
  end

  desc "run extendable scanner"
  task :extendible do
    engine = WordScanners::ScanningEngine.new
    scanner = ::WordScanners::ExtendibleScanner.new(engine)
    run_scanner(scanner)
  end

  desc "run all scanners"
  task :all => ["scanner:readable","scanner:fast","scanner:extendible"]
end
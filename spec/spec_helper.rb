# typed: false
# frozen_string_literal: true

require 'pry'
require 'securerandom'

unless ENV['DISABLE_SIMPLECOV'] == 'true'
  require 'simplecov'
  require 'simplecov-console'

  SimpleCov.formatter = SimpleCov::Formatter::Console
  SimpleCov.start do
    add_filter %r{\A/spec/}
  end
end

require 'rspec/expectations'
require './lib/primitive'

TEMP_DIR = File.join('tmp', 'spec')

def fixture_path(*)
  File.join('spec', 'fixtures', *)
end

def read_fixture(*)
  read(fixture_path(*))
end

def read(path)
  File.read(path)
end

def read_temp_file(*path)
  read(fixture_path(*path))
end

RSpec.configure do |config|
  config.before(:suite) do
    FileUtils.rm_rf(TEMP_DIR)
    FileUtils.mkdir_p(TEMP_DIR)
  end
end

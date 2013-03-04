BOOT_PATH = File.expand_path('../../config/boot',  __FILE__)

ENV['APP_ENV'] = 'test'

require BOOT_PATH
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new
require('minitest/autorun')
require('minitest/reporters')

require_relative('../Song.rb')

MiniTest::Reporters.use! Minitest::Reporters::SpecReporter.new

class SongTest < Minitest::Tests



end

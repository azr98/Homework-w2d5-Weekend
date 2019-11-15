require('minitest/autorun')
require('minitest/reporters')

require_relative('../Room.rb')
require_relative('../Song.rb')
require_relative('../Guest.rb')

MiniTest::Reporters.use! Minitest::Reporters::SpecReporter.new

class RoomTest < Minitest::Test

  def setup()
    @room = Room.new('Karryonkie',2,3)

    @song1 = Song.new('Through the wire','Kanye West')
    @song2 = Song.new('Nas is like','Nas')
    @song3 = Song.new('Santeria','Pusha-T')
    @song4 = Song.new('Long time','Playboy carti')
    @songs = [@song1,@song2,@song3]

    @guest1 = Guest.new('Azhar',4,@song1)
    @guest2 = Guest.new('Esa',4,@song2)
    @guest3 = Guest.new('Aaida',4,@song3)
    @guest4 = Guest.new('Tariq',4,@song4)

    @broke_guest = Guest.new('Mbarak',1,@song4)
  end

  def test_Room_name
    assert_equal('Karryonkie',@room.name)
  end

  def test_add_song
    @room.add_song(@song1)
    assert_equal(1,@room.playlist.size)
  end

  def test_check_in_guest
    @room.check_in(@guest4)
    assert_equal(1,@room.guests_present.size)
  end
  # guests_present = 1

  def test_guest_check_out
    @room.check_out(@guest4)
    assert_equal(0,@room.guests_present.size)
  end
  # guests_present = 0

  def test_room_is_full
    @room.check_in(@guest1)
    @room.check_in(@guest2)
    @room.check_in(@guest3)

    assert_equal("We are too full some people have to check out before Tariq can check in",@room.check_in(@guest4))
  end
  #guests_present = 3

  def test_not_enough_cash
    @room.check_out(@guest1)
    @room.check_out(@guest2)
    @room.check_out(@guest3)

    assert_equal("You don't have enough for the entry fee",@room.check_in(@broke_guest))
  end
  #guests_present = 0

  def test_cash_after_fee_paid
    @room.check_in(@guest1)
    assert_equal(2,@guest1.cash)
  end
  #guests_present = 1

  def test_song_already_in_playlist
    @room.playlist.push(@song2)
    assert_equal("Woo!!",@room.check_in(@guest2))
  end
  #guests_present = 2

  def test_song_added_after_check_in
    @room.check_in(@guest3)
    assert_equal(@song3,@room.playlist[-1])
  end
  # #guests_present = 3

  def test_fee_revenue
    assert_equal(6,@room.fee_revenue)
  end

end

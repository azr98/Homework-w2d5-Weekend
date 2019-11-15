class Guest

  attr_reader :name, :fav_song

  attr_accessor :cash

  def initialize(name,cash,fav_song)
    @name = name
    @cash = cash
    @fav_song = fav_song
  end

end

class Room

  attr_reader :name, :fee
  attr_accessor :guests_present, :playlist, :total_space, :free_space, :fee_revenue

  def initialize(name,fee,total_space)
    @name = name
    @guests_present = []
    @playlist = []
    @total_space  = total_space
    @fee = fee
    @fee_revenue = 0
  end

  def add_song(song)
    @playlist.push(song)
  end

  def check_in(guest)
    if @guests_present.size < total_space && guest.cash > @fee
      @guests_present.push(guest)
      guest.cash -= @fee
      @fee_revenue += @fee
    elsif guests_present.size >= total_space
      return "We are too full some people have to check out before #{guest.name} can check in"
    else
      return "You don't have enough for the entry fee"
    end

    if @playlist.include?(guest.fav_song)
      return "Woo!!"
    else
      add_song(guest.fav_song)
    end
  end

  def check_out(guest)
    @guests_present.delete(guest)
    @playlist.delete(guest.fav_song)
  end




end

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    new_song = Song.new 
    new_song.save
    return new_song
  end
    
  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    return new_song
  end
  
  def self.create_by_name(name)
    new_song = Song.new_by_name(name)
    @@all.push(new_song)
    return(new_song)
  end
  
  def self.find_by_name(name)
    @@all.each do |x| 
      if(x.name == name)
        return x 
      end 
    end 
    return nil
  end
  
  def self.find_or_create_by_name(name)
    find_song = Song.find_by_name(name)
    if(find_song != nil)
      return find_song
    else 
      new_song = Song.create_by_name(name)
      return new_song
    end
  end
  
  def self.alphabetical
       temp = @@all.sort do |a, b|
        if a.name == b.name 
          0 
        elsif a.name < b.name 
          -1 
        else a.name > b.name 
          1 
      end
      return temp
  end
  
  def self.new_from_filename(name)
    data = name.split(/[-.]/)
    out_song = Song.new 
    out_song.name = data[1][1..-1]
    out_song.artist_name = data[0][0..-2]
    return out_song
  end 
  
  def self.create_from_file(name)
    out_song = Song.new_from_filename(name)
    out_song.save
    return out_song
  end 
  
  def self.destroy_all
    @@all.clear
  end

  
end
      

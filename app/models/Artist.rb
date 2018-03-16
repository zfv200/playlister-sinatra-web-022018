class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  #method to turn name into slug

  #class method to find the object with the slug-name given
end

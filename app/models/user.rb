class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }  
  validates :password, presence: true, on:create
  has_many :songs
  has_many :playlists
  has_many :songs_in_playlist, through: :playlists, source: :song
  has_secure_password
end

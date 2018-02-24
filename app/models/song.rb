class Song < ActiveRecord::Base
  validates :title, presence: true, length: { in: 2..30}
  validates :artist, presence: true,  length: { in: 2..30}
  belongs_to :user
  has_many :playlists
  has_many :adding_users, through: :playlists, source: :user
end

class Music < ApplicationRecord
  belongs_to :album
  belongs_to :artist
  has_many :likes
  has_many :playlists
  has_many :comments, dependent: :destroy
  has_one_attached :audio

  validates :name, presence: true
  validates :artist_id, presence: true
  validates :audio, content_type: { in: %w[audio/mpeg], message: '：mp3であげてください' }
end

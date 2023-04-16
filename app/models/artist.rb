class Artist < ApplicationRecord
  # belongs_to :user
  has_many :musics, -> { order(id: :desc) }
  belongs_to :user, optional: true
  validates :name, presence: true, uniqueness: true
  default_scope -> { order(id: :desc) }
end

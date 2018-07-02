class Song < ApplicationRecord
  belongs_to :album

  validates :title, presence: true
  validates :duration, presence: true
end

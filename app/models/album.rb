class Album < ApplicationRecord
    has_many :songs, dependent: :destroy

    validates :title, presence: true
    validates :artist, presence: true
end

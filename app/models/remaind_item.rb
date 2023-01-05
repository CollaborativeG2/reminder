class RemaindItem < ApplicationRecord
    belongs_to :user
    has_many :remainds

    validates :description, length: { maximum: 140 }
end
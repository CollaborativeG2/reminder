class RemindItem < ApplicationRecord
    belongs_to :user
    has_many :reminds

    validates :description, length: { maximum: 140 }
end
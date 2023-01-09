class RemindItem < ApplicationRecord
    belongs_to :user
    has_many :reminds, dependent: :destroy

    validates :description, length: { maximum: 140 }
end
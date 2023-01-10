class RemindItem < ApplicationRecord
    belongs_to :user
    has_many :reminds, dependent: :destroy
end
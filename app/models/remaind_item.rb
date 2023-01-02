class RemaindItem < ApplicationRecord
    belongs_to :user
    has_many :remainds
end
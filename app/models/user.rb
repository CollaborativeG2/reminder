class User < ApplicationRecord
  has_many :remind_items, dependent: :destroy
end

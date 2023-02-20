class Message < ApplicationRecord
  scope :containing, -> (query) { where("body LIKE ?", "%#{query}%") }
end

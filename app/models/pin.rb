class Pin < ActiveRecord::Base
  validates :description, presence: true, length: { minimum: 20, maximum: 200 }
  belongs_to :user
end

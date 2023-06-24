class Review < ApplicationRecord
  belongs_to :camera
  belongs_to :user
end

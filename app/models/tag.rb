class Tag < ApplicationRecord
  has_many :tag_tags, dependent: :destroy
  has_many :questions, through: :tag_tags
end


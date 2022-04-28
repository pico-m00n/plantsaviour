class Tag < ApplicationRecord
  has_many :tag_tags, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :questions, through: :tag_tags
  has_many :posts, through: :post_tags
end


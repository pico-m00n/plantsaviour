class Bookmark < ApplicationRecord
  belongs_to :end_user
  belongs_to :question
end

class Reaction < ApplicationRecord
  belongs_to :answer
  belongs_to :end_user
end

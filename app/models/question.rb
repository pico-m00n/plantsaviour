class Question < ApplicationRecord
  belongs_to :end_user
  has_many :answers, dependent: :destroy
  has_many :tag_tags, dependent: :destroy
  has_many :tags, through: :tag_tags
  has_many :bookmarks, dependent: :destroy
  
  def bookmarked_by?(end_user)
    bookmarks.where(end_user_id: end_user).exists?
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @question = Question.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
      @question = Question.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @question = Question.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @question = Question.where("title LIKE?","%#{word}%")
    else
      @question = Question.all
    end
  end

end

class Question < ActiveRecord::Base
has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true


  def upvote
    self.vote_count += 1
    self.save
  end

  def downvote
    self.vote_count -= 1
    self.save
  end


end

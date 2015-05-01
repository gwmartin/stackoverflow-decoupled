class Answer < ActiveRecord::Base
  belongs_to :question

  def upvote
    self.vote_count +=1
    self.save
  end

  def downvote
    self.vote_count -=1
    self.save
  end
end

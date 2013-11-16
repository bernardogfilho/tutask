class Question < Post
  belongs_to :task
  has_many :answers
end
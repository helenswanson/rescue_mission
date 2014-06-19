class Answer < ActiveRecord::Base
  belongs_to :question

  validates :response, length: { minimum: 50 }, null: false
  validates :question_id, null: false
end

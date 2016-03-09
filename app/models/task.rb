class Task < ActiveRecord::Base

  belongs_to :user
  belongs_to :relation

  scope :group_tasks,
    lambda { |relation_id, user_id| where("relation_id = ? AND user_id = ?", relation_id, user_id) }
end

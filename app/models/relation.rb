class Relation < ActiveRecord::Base
	belongs_to :user
	belongs_to :patner, class_name: "User"

	has_many :tasks
	#scope :verifying, -> { where(verified: nil) }
	#scope :done_verify,  -> { where(verified: true) }
end

class User < ActiveRecord::Base

  before_save { self.email = email.downcase }

  has_secure_password
  
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                                    format: { with: VALID_EMAIL_REGEX },  
                                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 2 }

  has_many :actives, class_name: "Relation", dependent: :destroy
  has_many :patners, through: :actives
  has_many :passives, class_name: "Relation",
                      foreign_key: "patner_id", dependent: :destroy
  has_many :users, through: :passives

  has_many :tasks

end


class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :categories
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  validates_presence_of :title, :body, :author
  validates_associated :author
end
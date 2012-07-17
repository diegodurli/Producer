class Post < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :categories
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  validates_presence_of :title, :body, :author, :slug, :published_at
  validates_uniqueness_of :slug
  validates_inclusion_of :draft, in: [true,false]
  validates_associated :author
  
  before_validation :generate_slug

  scope :published, lambda {
    where("draft = ? AND published_at < ?", false, Time.current)
  }
  
  scope :search, lambda { |terms|
    where("title LIKE :t OR body LIKE :t", t: "%#{terms}%")
  }

  def to_param
    "#{id}-#{slug}"
  end
  
  protected

  def generate_slug
    self.slug = title unless slug.present?
    self.slug = slug.parameterize
  end

end
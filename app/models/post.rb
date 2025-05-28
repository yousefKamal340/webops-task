class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  
  validates :title, presence: true
  validates :body, presence: true
  validate :must_have_at_least_one_tag
  
  after_create :schedule_deletion
  
  private
  
  def must_have_at_least_one_tag
    if tags.empty?
      errors.add(:tags, "must have at least one tag")
    end
  end
  
  def schedule_deletion
    PostDeletionJob.set(wait: 24.hours).perform_later(self)
  end
end 
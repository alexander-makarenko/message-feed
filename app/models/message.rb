class Message < ApplicationRecord
  has_ancestry
  belongs_to :user

  validates :user_id, presence: true
  validates :body, presence: true
  validates :body, length: { in: 1..300 }, if: -> { body.present? }

  def self.posts
    roots
  end

  def is_post?
    root?
  end

  def is_comment?
    !root?
  end

  def has_comments?
    has_children?
  end

  def comments
    children
  end
end
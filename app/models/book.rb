class Book < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :body, length: { maximum: 200 }

  validates :title, presence: true
  validates :body, presence: true

  def self.search(search)
      return Book.all unless search
      Book.where(['title LIKE ?', "%#{search}%"])
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :books, dependent: :destroy
 has_many :favorites, dependent: :destroy
 has_many :book_comments, dependent: :destroy

 has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
 has_many :following_user, through: :active_relationships, source: :followed

 has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
 has_many :follower_user, through: :passive_relationships, source: :follower


 def follow(user_id)
   active_relationships.create(followed_id: user_id)
 end


 def unfollow(user_id)
   active_relationships.find_by(followed_id: user_id).destroy
 end

 def following?(user)
   following_user.include?(user)
 end



 attachment :profile_image

  validates :introduction, length: { maximum: 50 }
  validates :name,    length: { in: 2..20 }
  validates :name, uniqueness: true

  def self.search(search,word)
     if search == "forward_match"
       @user = User.where("name LIKE?","#{word}%")

     elsif search == "backward_match"
       @user = User.where("name LIKE?","%#{word}")

     elsif search == "perfect_match"
       @user = User.where("#{word}")

     elsif search == "partial_match"
       @user = User.where("name LIKE?","%#{word}%")
     else
       @user = User.all
     end
  end
end
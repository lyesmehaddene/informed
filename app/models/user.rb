class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: { message: "Un nom d'utilisateur est obligatoire" }, length: { maximum: 50 }
  validates :email, presence: { message: "Un email est obligatoire" }
  validates :password, presence: { message: "Un mot de passe est obligatoire" }



  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments 

  # validates_uniqueness_of :username
  validates :username, uniqueness: true


  def generate_jwt
    JWT.encode({
      id: id,
      exp: 60.days.from_now.to_i},
      Rails.application.secrets.secret_key_base)
  end

end

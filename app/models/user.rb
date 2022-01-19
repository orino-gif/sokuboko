class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :accepted, presence: {message: ':利用規約にチェックを入力してください'}
         
  has_one :performer , dependent: :destroy 
end

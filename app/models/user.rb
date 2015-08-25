class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :show_user_assignments,
           dependent: :destroy

  has_many :shows,
           through: :show_user_assignments

  has_many :upcoming_episodes,
           class_name: Event,
           through: :shows
end

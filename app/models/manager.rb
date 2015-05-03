class Manager < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable, :trackable, :registerable, :rememberable
  devise :database_authenticatable, :recoverable, :validatable

  include Concerns::Email

  has_many :links
end

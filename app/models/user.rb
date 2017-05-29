class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :trackable, :validatable
  has_many :tickets,        dependent: :destroy

  enum user_lvl: [:regular, :admin]


  def forem_name
    email
  end

  def forem_email
    email
  end

end

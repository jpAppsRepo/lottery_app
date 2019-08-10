class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # role_id 0 = doctor, 1 = patients (default)
  def self.get_patients
    User.where(role_id: 1)
  end
end

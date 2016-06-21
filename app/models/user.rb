class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :assign_enduser_role

  def role_symbols
    (roles || []).map {|r| r.title.to_sym}
  end

  def assign_enduser_role
    enduser_role = Role.find_by_title("enduser")
    roles << enduser_role unless roles.include?(enduser_role)
  end

end

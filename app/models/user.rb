class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :secure_validatable, :security_questionable

  validates_uniqueness_of :login, :email, case_sensitive: false
  validates_presence_of :login, :email
  validates_length_of :password, minimum: 8
  validates_format_of :password, with: /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/
  attr_accessor :captcha

  def to_s
    "#{self.login} - #{self.email}"    
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(login) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

end

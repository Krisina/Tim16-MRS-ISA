class User < ActiveRecord::Base
  attr_accessor :password

  before_save :encrypt_password
  after_save :clear_password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :ime, :presence => true
  validates :prezime, :presence => true
  validates :adresa, :presence => true
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :presence => true, length: { minimum: 6 }, :confirmation => true
  #Only on Create so other actions like update password attribute can be nil

  #attr_accessible :username, :email, :password, :password_confirmation

  def self.authenticate(email="", login_password="")

    if  EMAIL_REGEX.match(email)    
      user = User.find_by_email(email)
    end

    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end   

  def match_password(login_password="")
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end

  def encrypt_password
    unless password.blank?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end
end

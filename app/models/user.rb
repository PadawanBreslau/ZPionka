class User < ActiveRecord::Base
  
attr_accessor  :password,  :password_confirmation
email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

validates :name, :presence => true, :length => { :maximum => 30, :minimum => 4 }
validates :surname, :presence => true, :length => { :maximum => 50, :minimum => 3 }
validates :email, :presence => true, :format => { :with => email_regex }
validates_numericality_of :rating, :on => :create, :greater_than_or_equal_to => 1000, :less_than_or_equal_to => 2800
validates_numericality_of :age, :on => :create, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 120
validates :password, :presence => true, :confirmation => true, :length => { :within => 6..40 }

before_save :encrypt_password

belongs_to :allowance
has_many :comments
has_many :infos
has_many :gamechats
has_many :observes


def has_password?(submitted_password)
  encrypted_password == encrypt(submitted_password)
end


def self.authenticate(login, submitted_password)
  user = find_by_login(login)
  return nil if user.nil?
  return user if user.has_password?(submitted_password)
end

def self.authenticate_with_salt(id, cookie_salt)
  user = find_by_id(id)
  (user && user.salt == cookie_salt) ? user : nil
end


private
def encrypt_password
  self.salt = make_salt if new_record?
  self.encrypted_password = encrypt(password)
end

def encrypt(string)
  secure_hash("#{salt}--#{string}")
end

def make_salt
  secure_hash("#{Time.now.utc}--#{password}")
end

def secure_hash(string)
  Digest::SHA2.hexdigest(string)
end
  
end

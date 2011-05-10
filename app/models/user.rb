class User < ActiveRecord::Base
  
attr_accessor  :password,  :password_confirmation
email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

validates :name, :presence => true
validates :surname, :presence => true
validates :email, :presence => true, :format => { :with => email_regex }
validates_numericality_of :rating
validates_numericality_of :age
validates :password, :presence => true, :confirmation => true
validates_uniqueness_of :email, :on => :create
validates_uniqueness_of :login, :on => :create

before_save :encrypt_password

has_one :allowance
has_many :comments
has_many :infos
has_many :gamechats
has_many :observes
has_many :games, :through => :observes

  def full_name  
     name = self.name + ' '  
     name += self.surname  
   end 


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

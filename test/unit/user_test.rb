require 'test_helper'

class UserTest < ActiveSupport::TestCase
	self.use_instantiated_fixtures  = true
	fixtures :users
	
	user = User.new(:login => "testLogin", :name => "Adam", :surname => "Malysz", :email => "email@email.com", :age => 12, :rating => 1200, :password => "Krowa", :about => "Jestem zielony romek")

	


  test "user creates names and email" do
    assert_equal user.login, "testLogin"
    assert_equal 'Adam Malysz', user.full_name 
    assert_equal user.email, "email@email.com"
    assert_match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, user.email, "Email is not properly constructed")
  end
  
  test "user checks about, age and rating" do
  	assert_equal user.age, 12
  	assert_equal user.rating, 1200
  	assert_equal user.about, "Jestem zielony romek"
  	assert_not_equal user.about, "Jestem zielony Romek"
  end
  
  test "user_password saving" do
  	assert_not_equal user.encrypted_password, "Krowa"
  	assert_not_equal user.encrypted_password, "krowa"
  #	assert_not_equal user.send :encrypt_password("krowa"), user.encrypted_password 
  #	assert_equal user.encrypt_password("Krowa"), user.encrypted_password 
  end
  



end

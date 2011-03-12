require 'test_helper'

class CommentTest < ActiveSupport::TestCase
	
	comment = Comment.new(:user_id =>1, :info_id =>1, :content => "It's good")
	
  test "comments fields are good set" do
    assert_equal comment.user_id ,1
    assert_equal comment.info_id ,1
    assert_equal comment.content ,"It's good"
    assert_not_equal comment.content ,"Its good"
    assert_not_equal comment.content ,"its good"
  end
  
	
  
end

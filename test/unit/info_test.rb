require 'test_helper'

class InfoTest < ActiveSupport::TestCase

info = Info.new( :title => "Testing info", :short_content => "Infos about infos", :content => "Lorem ipsum della blanco opoka ista elee" )

test "info properly created" do

	assert_not_nil info.title	
	assert_not_nil info.short_content
	assert_not_nil info.content
	assert_nil info.lead
end

test "info proper values" do
	assert_equal info.title, "Testing info"
	assert_equal info.short_content, "Infos about infos"
	assert_equal info.content, "Lorem ipsum della blanco opoka ista elee"
end

test "show_comment" do
	assert_not_nil info.show_comments(info.id)
end


end

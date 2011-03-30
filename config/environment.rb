# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ZPionka::Application.initialize!

require 'will_paginate'

ActionMailer::Base.smtp_settings =
{
    :tls => true,
    :address => 'smtp.gmail.com',
    :port => 587,
    :domain => 'gmail.com',
    :authentication => :plain,
    :user_name => 'zz.pawn@gmail.com',
    :password => 'kaktus5.'
}
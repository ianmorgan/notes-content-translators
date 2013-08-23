require 'rubygems'
require 'sinatra/base'
require 'erb'
require 'yaml'
require 'redcarpet'
require 'pygments.rb'
require 'rubypython'

require 'json'


require File.join(File.dirname(__FILE__), 'modules/helpers')
require File.join(File.dirname(__FILE__), 'modules/string_mixins')

class NotesTranslatorsApp < Sinatra::Base

helpers NotesHelpers
RubyPython.start()

get '/' do
  erb :home
end

get '/about' do 
  erb :about
end

post '/markdown/to/html' do 
  uploaded = extract_posted_data(params)
  html = markdown_with_pygments(uploaded)  
  html
end


not_found do
  erb :page_not_found
end

end
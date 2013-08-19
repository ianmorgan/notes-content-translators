require 'rubygems'
require 'sinatra/base'
require 'erb'
require 'yaml'
require 'redcarpet'
require 'pygments.rb'
require 'rubypython'

require 'json'
require "net/http"
require "uri"

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
  puts params
  
  uploaded = params[:file][:tempfile].read
  puts uploaded 
  markdown2 uploaded  
end




not_found do
  erb :page_not_found
end

end
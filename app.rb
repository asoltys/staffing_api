require 'sinatra'
require 'sinatra/authorization'
require 'active_record'

class Position < ActiveRecord::Base
end

before do
   config = YAML::load( File.open('database.yml') )['development']
   ActiveRecord::Base.establish_connection(config)
end

get '/assignments' do
  Position.all.to_json
end

# example schema file
require 'active_record'
require 'sinatra'

# Create a db according to environment
config = {
  :adapter => 'sqlite3',
  :database => "db/#{Sinatra::Application.environment.to_s}.sqlite3"
}

ActiveRecord::Base.establish_connection(config)
ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger.level = Logger::WARN


class Schema < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.string :slug
      t.text :body
      t.boolean :is_article
      t.boolean :is_live
      t.timestamps
    end unless ActiveRecord::Base.connection.tables.include?('pages')
    
    create_table :enquiries do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :message
      t.timestamps
    end unless ActiveRecord::Base.connection.tables.include?('enquiries')
  end

  def self.down
    drop_table :enquiries if ActiveRecord::Base.connection.tables.include?('enquiries')
    drop_table :pages if ActiveRecord::Base.connection.tables.include?('pages')
  end
end
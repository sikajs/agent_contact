# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  agent = Agent.create!(:name => "demo")
  for i in 1..3
    agent.contacts.create!(:name => "example#{i}", :tel => "0#{i}-12345678",
                           :address => "台北市哈哈街#{i}號")
  end
  agent.update!(:default_contact => 1)

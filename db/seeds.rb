# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

##importing scott's beer list to initially populate the website
beer_file=File.("#{Rails.root}/public/seed_data/beer.csv").encode("utf-8", replace: nil)

beer_file.open("#{Rails.root}/public/seed_data/beer.csv") do |beers|
  beers.read.each_line do |beer|
    name, rating, year, country, state_or_province = beer.chomp.split(",")
    #  to remove the quotes from the csv text:
    code.gsub!(/\A"|"\Z/, '')
    # to create each record in the database
    BeerList.create!(:name => name, :rating => rating, :year => year, :country=>country, :state_or_province => state_or_province)             
  end
end

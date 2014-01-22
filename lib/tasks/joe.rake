require 'csv'
namespace :data do
desc "Import teams from csv file"
task :import => [:environment] do

CSV.foreach('/public/seed_data/beers.csv', :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
  Beer.create(row.to_hash)
end

end

end

require 'CSV'
namespace :data do
desc "Import teams from csv file"
task :import => [:environment] do
  file=IO.read('/Users/joefalkson/projects/scottwebsite/public/seed_data/beers.csv').force_encoding("ISO-8859-1").encode("utf-8", replace: nil)
  CSV.foreach(file, :headers => true) do |row|
    Beer.create! (row.to_hash)
  end

end
end
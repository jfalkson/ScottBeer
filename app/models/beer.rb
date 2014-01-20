class Beer < ActiveRecord::Base
belongs_to :user
has_many :votes
has_many :comments



BEER_TYPES = ["category 1", "category 2", "category 3","category 4 ","category 5"]

BEER_RATING = ["1", "2", "3","4 ","5"]




#commenting out due to datatables gem providing search
# def self.search(query)
# # where(:title, query) -> This would return an exact match of the query
# where("rec_description like ? OR rec_type like ? OR link like ?", "%#{query}%","%#{query}%","%#{query}%") 
# 
# end



end

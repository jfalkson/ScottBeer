class Vote < ActiveRecord::Base
belongs_to :user
belongs_to :beer
validates :user_id, :uniqueness => { :scope => :beer_id }
end

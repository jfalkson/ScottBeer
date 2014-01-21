class BeersDatatable
  ##delegating helper methods to this class
  ##h is the html escape method used to prevent hacking
  delegate :params, :h, :link_to, :current_user, to: :@view
  include ApplicationHelper
  include Rails.application.routes.url_helpers

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Beer.count,
      iTotalDisplayRecords: beers.total_entries,
      aaData: data
    }
  end

private

#need to make this method actually change the votecount#
#user needs to be able to post
# right now vote count doesnt change and method doesnt get to second if statement
def upvotelnk(beer)
        if current_user && current_user.votes.where(:beer_id => beer.id, :up => true).present?
     	"you up-voted"
   		else
    		link_to 'click to up-vote', votes_path(:vote => {:beer_id => beer.id, :up => true}), :method => :post
   		end

end

def downvotelnk(beer)
    	if current_user && current_user.votes.where(:beer_id => beer.id, :up => false).present? 
    		"you down-voted"     	
    	else
      	link_to 'click to down-vote', votes_path(:vote => {:beer_id => beer.id, :up => false}), :method => :post
    	end
end

##map is a way to loop through instead of saying beers.each
  def data
    beers.map do |beer|
      [
      ##link to is a ruby function, the second argument is the path
      ##in this case the path leads to a beer id
        link_to(beer.title, beer),
        beer.rating,
        beer.country,
        beer.state_or_province,
        (beer.votes.where(:up=>true).count - beer.votes.where(:up => false).count),
        link_to('Add Comment',beer),
        ##when this code below is removed it works fine without an up/down vote option
		upvotelnk(beer) + " " + downvotelnk(beer)
      ]
    end
  end

## if recs isnt defined right now set it to fetch recs
  def beers
    @beers ||= fetch_beers
  end

  def fetch_beers
    beers = Beer.order("#{sort_column} #{sort_direction}")
    beers = beers.page(page).per_page(per_page)
    if params[:sSearch].present?
      beers = beers.where("title like :search OR country like :search OR state_or_province like :search", search: "%#{params[:sSearch]}%")
    end
    beers
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[title rating country state_or_province ]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
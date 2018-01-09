class Post < ApplicationRecord
	belongs_to :user
	validates_presence_of :title, :content
	
	include PgSearch
	pg_search_scope :search_by_full_post, against: [:title, :content],
	using: {
      tsearch: {
        prefix: true,
        	highlight: {
        		start_sel: '<b>',
        		stop_sel: '</b>',
      	}
      }
    }
end

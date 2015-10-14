class Event < ActiveRecord::Base
	scope :game_year, ->(game_year) { where(:game_year => game_year) }
	scope :batter, ->(batter) { where(:batter => batter) }

	self.table_name = "event_list"
	self.primary_key = "pitch_id"

	def self.batting_heatmap
		select(:px,:pz, :game_date, :event_des)
	end

	def hits
		where(event_des: ['Home Run','Triple', 'Double', 'Single'])
	end


	def event_count
	#determine how to weight event des value
		case self.event_des 
			when 'Home Run'
				return 2.1
			when 'Triple'
				return 1.62
			when 'Double'
				return 1.27
			when 'Single'
				return 0.89
			else
				0
		end
	end
	
end
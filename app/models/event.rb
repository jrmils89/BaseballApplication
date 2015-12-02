class Event < ActiveRecord::Base
	scope :game_year, ->(game_year) { where(:game_year => game_year) }
	scope :batter, ->(batter) { where(:batter => batter) }
	scope :game_id, ->(game) { where(:game_id => game) }
	scope :batter_name, ->(batter_name) { where(:batter_name => batter_name) }
	scope :pitcher_name, ->(pitcher_name) { where(:pitcher_name => pitcher_name) }


	self.table_name = "event_list"
	self.primary_key = "pitch_id"
	
	enum game_type: {
		"Regular Season": 1
	}
	enum pitch_type_str: {
		"All Fastballs": ["FA","FF","FT"],
		"Fastball": "FA",
		"Four-Seam Faseball": "FF",
		"Two-Seam Fastball": "FT",
		"Sinker": "SI",
		"Curveball": "CU",
		"Slider": "SL",
		"Change-up": "CH",
		"Forkball": "FO",
		"Cutter": "FC",
		"Split-Finger": "FS",
		"Knuckle-Curve": "KC",
		"Knuckleball": "KN",
		"Other": ["EP","SC","UN","IN","AB","PO"],
		"None": nil	
	}


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
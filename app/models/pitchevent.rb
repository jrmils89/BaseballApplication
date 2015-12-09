class Pitchevent
  include Mongoid::Document
  include Mongoid::Timestamps
  	field :game_year, type: Integer 
	field :batter, type: Integer 
	field :pitcher, type: Integer 
	field :game_id, type: Integer 
	field :batter_name, type: String 
	field :pitcher_name, type: String 
	field :pitch_type, type: String
	field :bat_side, type: String
	field :pitch_hand, type: String
	field :px, type: Float
	field :pz, type: Float
	field :game_date, type: Date
	field :event_des, type: String
	field :pitch_id, type: Integer


## Example of loading pitches from MySQL into Mongo
	# @events = Event.select(:pitch_id, :game_year, :batter, :pitcher, :game_id, 
	# 	:batter_name, :pitcher_name, :pitch_type, 
	# 	'stand AS bat_side', 'pitcher_throws AS pitch_hand', 
	# 	:px, :pz, :game_date, :event_des).where(game_year: 2015, batter: 446653)
	# @events.each do |e|
	# 	@pitchevent = Pitchevent.new(e.as_json)
	# 	@pitchevent.save
	# end


end
class Player < ActiveRecord::Base
	self.table_name = "player_names"
	self.primary_key = "eliasid"
end


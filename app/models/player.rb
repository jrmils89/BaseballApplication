class Player < ActiveRecord::Base
	self.table_name = "players"
	self.primary_key = "eliasid"


	def self.full_name
		select(:first,:last)
	end
end


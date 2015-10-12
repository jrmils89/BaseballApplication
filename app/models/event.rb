class Event < ActiveRecord::Base
	self.table_name = "event_list"
	self.primary_key = "pitch_id"
end
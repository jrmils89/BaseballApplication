module EventHelper
	def self.playernames
		a = Player.uniq.pluck(:names, :eliasid).sort_by! {|u| u.to_s}
		a = a.take_while {|x| x != nil}
	end
end

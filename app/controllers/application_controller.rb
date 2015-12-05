class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


def player_names
  	a = Player.uniq.pluck(:names, :eliasid).sort_by! {|u| u.to_s}
	a = a.take_while {|x| x != nil}
  end
  helper_method :player_names
end
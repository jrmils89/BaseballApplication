class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


def player_names
  	a = Player.uniq.pluck(:first, :last).sort_by! {|u| u.to_s}
  	a.map! {|x| x.join(" ")}
	a = a.take_while {|x| x != nil}
  end
  helper_method :player_names
end

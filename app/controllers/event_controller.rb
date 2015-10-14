class EventController < ApplicationController
  before_action only: [:index, :list, :edit, :update, :destroy]


	def index
		@events = Event.where(pitch_id: 0)
		filtering_params(params).each do |key, value|
		@events = @events.public_send(key, value) if value.present?
		end
	end

	def list
		if filtering_params(params).values.any?
			@events = Event.batting_heatmap.where(pitch_type: 'X')
			swings = 'Swinging Strik%'
			@swings = Event.batting_heatmap.where("event_des LIKE ?", "%#{swings}%")
			filtering_params(params).each do |key, value|
			@events = @events.public_send(key, value) if value.present?
			@swings = @swings.public_send(key, value) if value.present?
			end
		else 
			render :status => 404
		end

	end

	

	private

	def set_event
	  @event = Event.find(params[:pitch_id_two])
	end

	def event_params
	  params.require(:event).permit(:game_year, :pitch_id_two, :batter, :pitch_type)
	end

	def filtering_params(params)
		params.slice(:game_year, :pitch_id_two, :batter, :pitch_type)
	end

end

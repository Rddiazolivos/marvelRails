class RankingController < ApplicationController
	def index
		@users = User.order(:score)
	end
end

class HomesController < ApplicationController
  def index
    @performers = Performer.all
  end
end

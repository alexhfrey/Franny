class IdentitiesController < ApplicationController

def new
    @identity = Identity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @identity }
    end
  end
end

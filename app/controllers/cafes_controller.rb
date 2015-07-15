class CafesController < ApplicationController

  # SHOWS ALL POSTS
  def index

    @cafes = Cafe.all

     if params[:search].present?
      @cafes = Cafe.search params[:search]
    else
      @cafes = Cafe.all
    end

    # @cafes = Cafe.paginate(:page => params[:page])
    # Cafe.paginate(:page => params[:page], :per_page => 1)
  end
  ## THIS ACTION CREATES A POST, ITEMS THAT ARE ASSOCIATED WITH THE POST, AND THE POSTITEM ENTRY.

  def show
      
    @cafe = Cafe.find(params[:id])
  end
end

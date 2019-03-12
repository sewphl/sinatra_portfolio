require 'pry'
class TincturesController < ApplicationController

  get '/tinctures/:slug' do
    @tincture = Tincture.find_by_slug(params[:slug])
    #binding.pry
    erb :'/tinctures/tincture_show'
  end

end

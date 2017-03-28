class UrlsController < ApplicationController
   before_action :find_the_url, only: [:show, :shortened]

  def index
    @url = Url.new
  end

  def show
    redirect_to @url
  end

  def create
    @url = Url.new(url_params)
      if @url.save
        redirect_to shortened_path(@url.short_url)
      else
        flash[:error] = "Error!"
        render 'index'
      end
  end

  private

  def find_the_url
    @url = Url.find_by_short_url(params[:short_url])
  end

  def url_params
    params.require(:url).permit(:original_url)
  end
end


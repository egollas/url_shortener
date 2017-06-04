class UrlsController < ApplicationController
  def new
     @shortened_url = Url.new
  end
  def create
     @shortened_url = Url.new(shortened_url)
     if @shortened_url.save
       flash[:shortened_id] = @shortened_url.id
       redirect_to new_url_url
     else
       render :action => "new"
     end
   end

   def show
     @shortened_url = Url.find(params[:id])
     redirect_to @shortened_url.url
   end

   private

     def shortened_url
       params.require(:url).permit!
     end




 end

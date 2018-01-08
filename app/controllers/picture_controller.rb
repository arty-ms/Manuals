class PictureController < ApplicationController

  def create
    @picture = Picture.new(file_name: params[:file])
    if @media.save!
      respond_to do |format|
        format.json{ render :json => @picture }
      end
    end
  end
end


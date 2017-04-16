class PhotosController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @photo = @group.photos.new(set_param)
    @photo.set_image(params[:photo][:filename])
    @photo.save
    redirect_to group_path(@group.id)
  end

  def destroy
    @photo = Photo.find(params[:id])
    group_id = @photo.group_id
    @photo.destroy
    redirect_to group_path(group_id)
  end

  private
    def set_param
      params.require(:photo).permit(:filename)
    end
end

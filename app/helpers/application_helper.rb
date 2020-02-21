module ApplicationHelper

  def photo_url(user)
    if user.photo.attached?
      url_for(user.photo)
    elsif user.image?
      user.image
    else
      ActionController::Base.helpers.asset_path('avatar.png')
    end 
  end
end

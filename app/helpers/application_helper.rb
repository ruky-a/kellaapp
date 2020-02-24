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



  def resource_name
  :user
end

def resource
  @resource ||= User.new
end

def resource_class
  User
end

def devise_mapping
  @devise_mapping ||= Devise.mappings[:user]
end
end

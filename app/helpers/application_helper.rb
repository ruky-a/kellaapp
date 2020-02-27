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

class CodeRayify < Redcarpet::Render::HTML
  def block_code(code, language)
    CodeRay.scan(code, language).div(:line_numbers => :table)
  end
end

def markdown(text)
  coderayified = CodeRayify.new(:filter_html => true, :hard_wrap => true)
  options = {
    :fenced_code_blocks => true,
    :no_intra_emphasis => true,
    :autolink => true,
    :lax_html_blocks => true,
    :superscript => true
  }

  markdown_to_html = Redcarpet::Markdown.new(coderayified,options)
  markdown_to_html.render(text).html_safe
end

end

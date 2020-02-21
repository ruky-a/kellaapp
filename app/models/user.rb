class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  validates :first_name, presence: true, length: {maximum: 50}
  validates :last_name, presence: true, length: {maximum: 50}
  has_one_attached :photo

 after_create :send_admin_mail
def send_admin_mail
  UserMailer.send_welcome_email(self).deliver_later
end


  def self.from_omniauth(auth)
  user = User.where(email: auth.info.email).first 
  if user
    return user
  else
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0, 20]
    user.first_name = auth.info.name   
    user.image = auth.info.image 
    user.uid = auth.uid
    user.provider = auth.provider

    # user.skip_confirmation!
  end
 end
end

end

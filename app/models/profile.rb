class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :biography, :country, :email, :fullname , :user_id , :avatar

validates :fullname, :presence =>true
validates :country,  :presence =>true
validates :email,  :presence =>true
validates :user_id, :uniqueness => true



mount_uploader :avatar, AvatarUploader



end



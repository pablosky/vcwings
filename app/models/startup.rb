class Startup < ActiveRecord::Base



include Rails.application.routes.url_helpers
attr_accessible :name, :video, :vmoney , :website ,:founder , :description ,:website , :category , :revenue , :stage ,:country , :semail , :avatar



has_many :members
has_many :users , :through => :members
has_many :comments
#has_many :activities #comentado para el uso de la gema publicactivity
has_many :investments

mount_uploader :avatar, AvatarUploader

extend FriendlyId
friendly_id :name, use: [:slugged , :history]

validates :name, :presence =>true
validates :description,  :presence =>true
validates :semail,  :presence =>true
validates :category, :presence => true

validates :stage, :presence => true
validates :revenue, :presence =>true
validates :country,  :presence =>true


#falta uniqueness de website y name y email



def self.search(search)
  if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
end



end


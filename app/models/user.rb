class User < ActiveRecord::Base
   include Clearance::User
	attr_accessible :role, :name

   letsrate_rater
  # has_and_belongs_to_many :roles
   has_one :ubadge
   has_one :profile
   has_many :members
   has_many :startups , :through => :members
   


 ROLES = %w[admin moderator author banned]






end

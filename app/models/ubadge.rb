class Ubadge < ActiveRecord::Base
  belongs_to :user
  attr_accessible :advangel, :earlyadapt, :feedmaster, :ffather, :knowit, :moneywise, :vetinvestor, :voiceofwisdom, :user_id

  ##recordar borar el user id despues
end

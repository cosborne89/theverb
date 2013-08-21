class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  #associations
  has_one :partner, class_name: "User", foreign_key: "partner_id"
  
  before_save :two_way_partner
  
  def two_way_partner
      partner = User.find(self.partner_id)
      unless partner.partner_id
        partner.partner_id = self.id unless partner.partner_id
        partner.save
      end
  end
      
    
  
  #define roles
  ROLES = %w[user admin superadmin]
  def role?(base_role)
    role.present? && ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
  
  
  #define logging in with google
  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
        user = User.create(username: data["name"],
        		   email: data["email"],
	    		   password: Devise.friendly_token[0,20],
                   role: "user"
	    		  )
    end
    user
  end
  
end

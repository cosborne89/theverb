class Homespace < ActiveRecord::Base
    belongs_to :user
    belongs_to :partner, class_name: "User", foreign_key: "partner_id"
    has_many :posts
    

end

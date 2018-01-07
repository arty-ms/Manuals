class UserProvider < ApplicationRecord
  belongs_to :user
  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

    def self.find_for_oauth(auth, id)
          user = UserProvider.where(:provider => auth['provider'], :uid => auth['uid'], :username => auth['info']['name']).first
          unless user.nil?
                user.user        
          else		
          	unless id.nil?
                UserProvider.create!(
                provider: auth['provider'],
                uid: auth['uid'],
                user_id: id,
                username: auth['info']['name']
                )
                user = User.where(:user_id => id)
            else            	
           	end

        end
    end
end



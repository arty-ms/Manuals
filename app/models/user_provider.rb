class UserProvider < ApplicationRecord
  belongs_to :user
  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider


      def self.find_for_facebook_oauth(auth)

        user = UserProvider.where(:provider => auth.provider, :uid => auth.uid).first
        unless user.nil?
            user.user
        else
            registered_user = User.where(:email => auth.info.email).first
            unless registered_user.nil?
                        UserProvider.create!(
                              provider: auth.provider,
                              uid: auth.uid,
                              user_id: registered_user.id
                              )
                registered_user
            else
                user = User.create!(
                    name: auth.info.name,
                            email: auth.info.email,
                            password: Devise.friendly_token[0,20],
                            )
                user_provider = UserProvider.create!(
                    provider:auth.provider,
                            uid:auth.uid,
                              user_id: user.id
                    )
                user
            end
        end
    end

    def self.find_for_vk_oauth(auth)
        user = UserProvider.where(:provider => auth.provider, :uid => auth.uid).first
        unless user.nil?
            user.user
        else
            registered_user = User.where(:email => auth.info.email).first
            unless registered_user.nil?
                        UserProvider.create!(
                              provider: auth.provider,
                              uid: auth.uid,
                              user_id: registered_user.id
                              )
                registered_user
            else
                user = User.create!(
                    name: auth.info.name,
                              email: auth.info.email,
                              password: Devise.friendly_token[0,20],
                            )
                user_provider = UserProvider.create!(
                    provider:auth.provider,
                            uid:auth.uid,
                            user_id: user.id
                    )
                user
            end
        end
    end

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



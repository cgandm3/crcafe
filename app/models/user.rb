class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
        user.email = auth['info']['email'] || ""
      end
    end
  end
end

# class User < ActiveRecord::Base
#   class << self
#     def from_omniauth auth_hash
#       user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider']) do |u|
#         u.name = auth_hash['info']['name']
#         u.email = auth_hash['info']['email']
#       end
#     end
#   end
  
# end
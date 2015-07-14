class RemoveOauthColumns < ActiveRecord::Migration
  	def change
    	remove_column :users, :oauth_token, :oauth_expires_at
  	end
end

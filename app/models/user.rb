class User < ActiveRecord::Base
    
    def User::create_user! (paramshash)
        paramshash[:session_token] = SecureRandom.base64
        User::create!(paramshash)
    end
        
end

class Api::UserTokenController < Knock::AuthTokenController

    def create
        user = User.find_by(user: params[:user])
        if user & user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            render json: {
                jwt: encode_token({id: user.id, name: user.name})
            }
        end
    end
    
    private

    def encode_token(payload = {})
      exp= 24.hours.from_now
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
 
    end
 
    def decode_token(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base)
   end


end

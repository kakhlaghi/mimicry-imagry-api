class ApplicationController < ActionController::API
    include Knock::Authenticable

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end

  private
  # Define unauthorized access json response
      def unauthorized_entity(entity_name)
          render json: { error: "Unauthorized request" }, status:     
          :unauthorized
      end


end

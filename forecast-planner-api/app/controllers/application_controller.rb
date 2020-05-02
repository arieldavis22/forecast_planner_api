class ApplicationController < ActionController::API
    include ActionController::Cookies

    def current_user
        @current_user = User.find_by(id: session[:user_id]) 
    end

    def authenticated
        unless current_user
            render json: { error: "Please log in" }, status: :unauthorized
        end
    end
end

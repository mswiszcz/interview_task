class ApplicationController < ActionController::API
  rescue_from(Errors::Unauthorized) { |error| authentication_error(error) }
  rescue_from(ActiveRecord::RecordNotFound) { |error| not_found(error) }

  protected

  def current_user
    User.find_by(api_key: request.headers["HTTP_API_KEY"])
  end

  private

  def authentication_error(e)
    render(
      json: {
        errors: [{ message: e.message }]
      },
      status: :unauthorized
    )
  end

  def not_found(e)
    render(
      json: {
        errors: [{ message: e.message }]
      },
      status: :not_found
    )
  end
end

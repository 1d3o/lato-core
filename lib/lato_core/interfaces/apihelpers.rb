module LatoCore

  # This module contains a list of functions used to write application or
  # modules api. They permit to have a nice standard on api structure.
  module Interface::Apihelpers

    # This function render a normal success response with a custom payload.
    def core__send_request_success(payload)
      response = { result: true, error_message: nil }
      response[:payload] = payload if payload
      render json: response
    end

    # This function render an error message with a possible custom payload.
    def core__send_request_fail(error, payload: nil)
      response = { result: false, error_message: error }
      response[:payload] = payload if payload
      render json: response
    end

    # This function render an error message with the errors contained
    # on an entity.
    def core__send_entity_error(entity)
      render_request_fail(entity.errors.full_messages.to_sentence)
    end

    # This function render an error for a bad request with an error message.
    def core__send_bad_request_error(error)
      render json: { result: false, error_message: error }, status: 400
    end

    # Tis function render an error for an unauthorized request with
    # an error message.
    def core__send_unauthorized_request_error(error)
      render json: { result: false, error_message: error }, status: 401
    end

  end
end
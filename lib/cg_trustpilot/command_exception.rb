module CgTrustpilot
  class CommandException < RuntimeError
    attr_accessor :code, :message, :raw_response

    def initialize(code, message, raw_response)
      raise ApiResponseError(raw_response) unless code.present? && message.present?

      @code = code
      @message = message
      @raw_response = raw_response
    end
  end
end

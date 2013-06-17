module CgTrustpilot
  class ConnectionException < RuntimeError; end
  class ConnectionError < ConnectionException; end

  class ApiResponseError < ConnectionException
    attr_accessor :raw_response

    def initialize(raw_response)
      @raw_response = raw_response
    end
  end
end

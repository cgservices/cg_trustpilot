module CgTrustpilot
  class Client

    def get_trustpilot_feed
      require "net/http"
      feed_url = CgTrustpilot.config[:feed]
      uri = URI.parse(feed_url)
      http = Net::HTTP.new(uri.host, uri.port)
      res = http.get(uri.request_uri)
      case res
        when Net::HTTPSuccess, Net::HTTPRedirection
          return CgTrustpilot::Feed.new(JSON.parse(res.body))
        else
          raise ApiResponseError, 'Response is not Net::HTTPSuccess, received response body: ' << res.body
      end
    end
  end
end

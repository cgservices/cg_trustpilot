module CgTrustpilot
  class Client

    # http library for doing a http request
    require "net/http"

    def parse_trustpilot_feed(name = 'feed.json', feed_url = nil)
      # json parse the unzipped tempfile and return as a Trustpilot feed object
      trustpilot_rating = Rails.cache.fetch(name, expires_in: 15.minutes, race_condition_ttl: 2.minutes) do
        get_trustpilot_feed(name, feed_url)
      end

      CgTrustpilot::Feed.new(JSON.parse(trustpilot_rating))
    rescue
      CgTrustpilot::Feed.new({})
    end

    def get_trustpilot_feed(name = 'feed.json', feed_url = nil)
      # get the feed url from the config
      feed_url ||= CgTrustpilot.config[:feed]

      uri = URI.parse(feed_url)
      http = Net::HTTP.new(uri.host, uri.port)
      # do a http get request
      res = http.get(uri.request_uri)
      case res
        when Net::HTTPSuccess
          res.body.force_encoding("utf-8")
      end
    rescue
      Rails.cache.read(name)
    end
  end
end

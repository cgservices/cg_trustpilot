module CgTrustpilot
  class Client

    # http library for doing a http request
    require "net/http"

    def parse_trustpilot_feed(name = 'feed.json', feed_url = nil)
      # file = "#{CgTrustpilot.config[:temp_folder]}/#{name}"
      # json parse the unzipped tempfile and return as a Trustpilot feed object

      trustpilot_rating = Rails.cache.fetch(name, race_condition_ttl: 2.minutes) do
        get_trustpilot_feed(name, feed_url)
      end

      CgTrustpilot::Feed.new(JSON.parse(trustpilot_rating))
    rescue
      CgTrustpilot::Feed.new({})
    end

    def get_trustpilot_feed(name = 'feed.json', feed_url = nil)
      hash = Securandom.base64
      # file = "#{CgTrustpilot.config[:temp_folder]}/#{hash}.#{name}"
      # get the feed url from the config
      feed_url ||= CgTrustpilot.config[:feed]

      uri = URI.parse(feed_url)
      http = Net::HTTP.new(uri.host, uri.port)
      # do a http get request
      res = http.get(uri.request_uri)
      case res
        when Net::HTTPSuccess
          Rails.cache.write(name, res.body.force_encoding("utf-8"), expires_in: 15.minutes)
          # save the result as file
          # File.open(file,'w') do |f|
#             f.write res.body.force_encoding("utf-8")
#           end
#           File.rename(file, "#{CgTrustpilot.config[:temp_folder]}/#{name}")
      end
    ensure
      # File.unlink(file)
    end
  end
end

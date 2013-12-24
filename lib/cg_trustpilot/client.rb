module CgTrustpilot
  class Client

    # http library for doing a http request
    require "net/http"

    def initialize(feed_url = nil)
      @feed_url = feed_url
    end

    def get_trustpilot_feed(filename = 'feed.json')
      file = "#{CgTrustpilot.config[:temp_folder]}/#{filename}"
      if filename == 'feed.json'
        # get the feed url from the config
        unless @feed_url.present?
          feed_url = CgTrustpilot.config[:feed]
        else
          feed_url = @feed_url
        end
        uri = URI.parse(feed_url)
        http = Net::HTTP.new(uri.host, uri.port)
        # do a http get request
        res = http.get(uri.request_uri)
        case res
          when Net::HTTPSuccess
            # save the result as file
            File.open(file,'w') do |f|
              f.write res.body.force_encoding("utf-8")
            end
        end
      else
        file = filename
      end
      # json parse the unzipped tempfile and return as a Trustpilot feed object
      file_contents = File.open(file) { |f| f.read }
      CgTrustpilot::Feed.new(JSON.parse(file_contents))
    rescue
      CgTrustpilot::Feed.new({})
    end
  end
end

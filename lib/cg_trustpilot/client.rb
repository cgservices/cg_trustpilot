module CgTrustpilot
  class Client

    # http library for doing a http request
    require "net/http"

    def parse_trustpilot_feed(filename = 'feed.json', feed_url = nil)
      file = "#{CgTrustpilot.config[:temp_folder]}/#{filename}"
      # json parse the unzipped tempfile and return as a Trustpilot feed object

      get_trustpilot_feed(filename, feed_url) unless File.exists?(file)

      file_contents = File.open(file) { |f| f.read }
      CgTrustpilot::Feed.new(JSON.parse(file_contents))
    rescue
      CgTrustpilot::Feed.new({})
    end

    def get_trustpilot_feed(filename = 'feed.json', feed_url = nil)
      hash = Securandom.base64
      file = "#{CgTrustpilot.config[:temp_folder]}/#{hash}.#{filename}"
      # get the feed url from the config
      feed_url ||= CgTrustpilot.config[:feed]

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
          File.rename(file, "#{CgTrustpilot.config[:temp_folder]}/#{filename}")
      end
    ensure
      File.unlink(file)
    end
  end
end

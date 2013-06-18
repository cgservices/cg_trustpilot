module CgTrustpilot
  class Client

    # http library for doing a http request
    require "net/http"

    def get_trustpilot_feed(filename = 'feed.json')
      file = "#{CgTrustpilot.config[:temp_folder]}/#{filename}"
      # check if a file was given
      if filename == 'feed.json'
        # get the feed url from the config
        feed_url = CgTrustpilot.config[:feed]
        uri = URI.parse(feed_url)
        http = Net::HTTP.new(uri.host, uri.port)
        # do a http get request
        res = http.get(uri.request_uri)
        case res
          when Net::HTTPSuccess
            # save the result as file
            File.open(file,'w') do |f|
              f.write res.body
            end
        end
      else
        file = filename
      end
      # json parse the unzipped tempfile and return as a Trustpilot feed object
      file_contents = File.open(file) { |f| f.read }
      CgTrustpilot::Feed.new(JSON.parse(file_contents))
    end
  end
end

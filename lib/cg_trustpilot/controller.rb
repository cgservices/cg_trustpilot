require 'cg_trustpilot/client'
require 'cg_trustpilot/feed'

module CgTrustpilot
  module Controller

    def trustpilot(filename = 'feed.json', feed_url = nil)
      client = CgTrustpilot::Client.new
      render :partial => "trustpilot/block", :locals => {:feed => client.parse_trustpilot_feed}
    end
  end
end

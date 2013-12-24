require 'cg_trustpilot/client'
require 'cg_trustpilot/feed'

module CgTrustpilot
  module Controller

    def trustpilot(feed_url = nil)
      client = CgTrustpilot::Client.new(feed_url)
      render :partial => "trustpilot/block", :locals => {:feed => client.get_trustpilot_feed}
    end
  end
end

require 'cg_trustpilot/client'
require 'cg_trustpilot/feed'

module CgTrustpilot
  module Controller

    def trustpilot
      client = CgTrustpilot::Client.new
      render :partial => "trustpilot/block.html.erb", :locals => {:feed => client.get_trustpilot_feed}
    end
  end
end

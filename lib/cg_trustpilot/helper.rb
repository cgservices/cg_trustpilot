module CgTrustpilot
  module Helper

    def trustpilot
      render :partial => "trustpilot/block.html.erb", :locals => {
        :feed => CgTrustpilot::Client.get_trustpilot_feed
      }
    end
  end
end

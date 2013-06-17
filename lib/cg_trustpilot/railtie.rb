require 'cg_trustpilot/helper'

module CgTrustpilot
  class Railtie < Rails::Railtie
    initializer "cg_trustpilot.initialize" do
      ActionController::Base.append_view_path(File.dirname(__FILE__) + "/../../app/views") if ActionController::Base.respond_to?(:append_view_path)
      ActionView::Base.send :include, CgTrustpilot::Helper
    end
  end
end
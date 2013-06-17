require 'cg_trustpilot/controller'

module CgTrustpilot
  class Railtie < Rails::Railtie
    initializer "cg_trustpilot.initialize" do
      ActionController::Base.append_view_path(File.dirname(__FILE__) + "/../../app/views") if ActionController::Base.respond_to?(:append_view_path)
      ActionView::Base.send :include, CgTrustpilot::Controller
    end
  end
end
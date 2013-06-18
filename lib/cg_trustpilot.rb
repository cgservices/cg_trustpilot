require 'active_support/all'

require 'cg_trustpilot/client'
require 'cg_trustpilot/feed'
require 'cg_trustpilot/controller'
require 'cg_trustpilot/railtie' if defined?(Rails)

module CgTrustpilot
  mattr_accessor :config
end

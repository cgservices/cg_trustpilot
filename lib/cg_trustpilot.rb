require 'active_support/all'

require 'cg_trustpilot/client'
require 'cg_trustpilot/connection_exception'
require 'cg_trustpilot/command_exception'
require 'cg_trustpilot/feed'
require 'cg_clicktale/railtie' if defined?(Rails)
require 'cg_trustpilot/helper'

module CgTrustpilot
  mattr_accessor :config
end

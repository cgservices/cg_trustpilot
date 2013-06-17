require 'rails/generators'

module CgTrustpilot
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "CgTrustpilot installer"

      # commandline arguments
      argument :account_id, :type => :string, :required => true, :desc => "TrustPilot account ID", :banner => "ACCOUNT_ID"

      def self.source_root
        @source_root ||= File.join(File.dirname(__FILE__), 'templates')
      end

      def setup_trustpilot
        if account_id
          # create a loader for the config
          template "load_config.rb", "config/initializers/trustpilot.rb"
          # create the config file
          template 'config.yml', File.join('config', 'trustpilot.yml')
        end
      end

    end
  end
end

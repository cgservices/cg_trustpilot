# CG TrustPilot
Gem to implement TrustPilot in Rails 3 applications.

## Installation
### In Gemfile
gem 'cg_trustpilot', :git => "https://github.com/cgservices/cg_trustpilot.git"

### Generator
Install TrustPilot support by using the generator

    rails g cg_TrustPilot:install <account_id>

**Project ID** is the TrustPilot project id, for example '100000'. This argument is mandatory.

The generator adds two files to your Rails application; *trustpilot.yml* in the config folder and *trustpilot.rb* in the config/initializers folder.

#### config/trustpilot.yml
This config file contains the configuration of TrustPilot. It contains the project id, ratio and params and enables you to turn TrustPilot on and off in the different Rails environments. See below for configuration options.

#### config/initializers/trustpilot.rb
This initializer loads the trustpilot.yml config file and sets the config in the CgTrustpilot gem with the options found in the config file.

## Usage
After installation, include

    <%= trustpilot() %>

before the in your view to enable the TrustPilot block.

## Configuration
The basic configuration of the CgTrustPilot gem can be found in the config.yml file in your Rails app.

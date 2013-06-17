raw_config = File.read(::Rails.root + "config/trustpilot.yml")
CgTrustpilot.config = YAML.load(raw_config)[::Rails.env].symbolize_keys
puts "Setting TRUSTPILOT"

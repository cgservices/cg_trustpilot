raw_config = File.read(::Rails.root + "config/trustpilot.yml")
CgTrustpilot.config = YAML.load(raw_config)
puts "Setting TRUSTPILOT"

raw_config = File.read(::Rails.root + "config/trustpilot.yml")
config = YAML.load(raw_config)
config[:temp_folder] = "#{Rails.root}#{config[:temp_folder]}"
CgTrustpilot.config = config
puts "Setting TRUSTPILOT"

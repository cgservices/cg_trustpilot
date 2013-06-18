module CgTrustpilot
  class Feed

    attr_accessor :feed_data

    def initialize(feed)
      self.feed_data = feed
    end

    def is_valid?
      if self.feed_data['DomainName'].blank? || self.feed_data['TrustScore']['Score'].blank? || self.feed_data['TrustScore']['Stars'].blank? || self.feed_data['ReviewCount']['Total'].blank? || self.feed_data['ReviewPageUrl'].blank?
        false
      else
        true
      end
    end

    def get_domain_name
      unless self.feed_data['DomainName'].blank?
        return self.feed_data['DomainName']
      end
    end

    def get_score
      unless self.feed_data['TrustScore'].blank?
        unless self.feed_data['TrustScore']['Score'].blank?
          return self.feed_data['TrustScore']['Score']
        end
      end
    end

    def get_review_count
      unless self.feed_data['ReviewCount'].blank?
        unless self.feed_data['ReviewCount']['Total'].blank?
          return self.feed_data['ReviewCount']['Total']
        end
      end
    end

    def get_stars
      unless self.feed_data['TrustScore'].blank?
        unless self.feed_data['TrustScore']['Stars'].blank?
          return self.feed_data['TrustScore']['Stars']
        end
      end
    end

    def get_human_score
      unless self.feed_data['TrustScore'].blank?
        unless self.feed_data['TrustScore']['Human'].blank?
          return self.feed_data['TrustScore']['Human']
        end
      end
    end

    def get_review_url
      unless self.feed_data['ReviewPageUrl'].blank?
        return self.feed_data['ReviewPageUrl']
      end
    end
  end
end

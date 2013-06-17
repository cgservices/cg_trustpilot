module CgTrustpilot
  class Feed

    attr_accessor :feed_data

    def initialize(feed)
      self.feed_data = feed
    end

    def get_domain_name
      unless self.feed_data['DomainName'].blank?
        return self.feed_data['DomainName']
      end
      raise ApiResponseError, '[DomainName] not found in seed data: ' << self.feed_data
    end

    def get_score
      unless self.feed_data['TrustScore'].blank?
        unless self.feed_data['TrustScore']['Score'].blank?
          return self.feed_data['TrustScore']['Score']
        end
      end
      raise ApiResponseError, '[TrustScore][Score] not found in seed data: ' << self.feed_data
    end

    def get_review_count
      unless self.feed_data['ReviewCount'].blank?
        unless self.feed_data['ReviewCount']['Total'].blank?
          return self.feed_data['ReviewCount']['Total']
        end
      end
      raise ApiResponseError, 'ReviewCount][Total] not found in seed data: ' << self.feed_data
    end

    def get_stars
      unless self.feed_data['TrustScore'].blank?
        unless self.feed_data['TrustScore']['Stars'].blank?
          return self.feed_data['TrustScore']['Stars']
        end
      end
      raise ApiResponseError, '[TrustScore][Stars] not found in seed data: ' << self.feed_data
    end

    def get_human_score
      unless self.feed_data['TrustScore'].blank?
        unless self.feed_data['TrustScore']['Human'].blank?
          return self.feed_data['TrustScore']['Human']
        end
      end
      raise ApiResponseError, '[TrustScore][Human] not found in seed data: ' << self.feed_data
    end

    def get_review_url
      unless self.feed_data['ReviewPageUrl'].blank?
        return self.feed_data['ReviewPageUrl']
      end
      raise ApiResponseError, '[ReviewPageUrl] not found in seed data: ' << self.feed_data
    end
  end
end

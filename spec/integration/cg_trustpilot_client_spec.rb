require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Trustpilot Client" do

  context 'when trustpilot stream is loaded from a file' do
    before do
      CgTrustpilot.config = {:feed => "http://s.trustpilot.com.s3-external-3.amazonaws.com/tpelements/1832271/f.json.gz", :temp_folder => '/tmp/cache'}
      file = File.expand_path(File.dirname(__FILE__) + '/../fixtures/feed.json')
      client = CgTrustpilot::Client.new
      @feed = client.get_trustpilot_feed(file)
    end

    it "should return a valid feed object" do
      @feed.is_valid?.should eq(true)
    end

    it "should return the correct review url" do
      @feed.get_review_url.should eq('http://www.trustpilot.com/review/www.recharge.com')
    end

    it "should return the correct domain name" do
      @feed.get_domain_name.should eq('www.recharge.com')
    end

    it "should return the correct number of stars" do
      @feed.get_stars.should eq(4)
    end

    it "should return the correct human score" do
      @feed.get_human_score.should eq('Good')
    end
  end

  context 'when trustpilot stream is loaded from http' do
    before do
      CgTrustpilot.config = {:feed => "http://s.trustpilot.com.s3-external-3.amazonaws.com/tpelements/1832271/f.json.gz", :temp_folder => File.expand_path(File.dirname(__FILE__) + "/../../tmp/cache/")}
      client = CgTrustpilot::Client.new
      @feed = client.get_trustpilot_feed
    end

    it "should return a valid feed object" do
      @feed.is_valid?.should eq(true)
    end
  end
end

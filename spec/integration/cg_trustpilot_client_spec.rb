require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Trustpilot Client" do

  before do
    CgTrustpilot.config = {:feed => "/../fixtures/f.json.gz"}
    @client = CgTrustpilot::Client.new
  end

  it "should return the correct review url" do
    feed = @client.get_trustpilot_feed
    feed.get_review_url.should eq('http://www.trustpilot.com/review/www.recharge.com')
  end

  it "should return the correct domain name" do
    feed = @client.get_trustpilot_feed
    feed.get_domain_name.should eq('www.recharge.com')
  end

  it "should return the number of stars" do
    feed = @client.get_trustpilot_feed
    feed.get_stars.should eq(4)
  end

  it "should return the human score" do
    feed = @client.get_trustpilot_feed
    feed.get_human_score.should eq('Good')
  end

end

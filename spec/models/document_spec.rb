require "rails_helper"

RSpec.describe Document, :type => :model do
  describe "#slug" do
    it "generate slug for new document" do
      document = Document.create!
      expect(document.slug.length).to_not be_nil
    end    
  end
  
  describe "#find_by_slug" do
    it "find a document by its slug" do
      document = Document.create!
      found = Document.find_by_slug document.slug
      expect(document.slug).to eq(found.slug)
    end
  end

  describe "#destination" do
    it "contains slug fragment" do
      document = Document.create!(url: "http://example.com")
      destination_uri = URI.parse document.destination
      expect(destination_uri.fragment).to eq(document.slug)
    end
  end
  
  describe ".containing" do
    it "data contain specific attributes" do
      document = Document.create!(
        url: "http://example.com",
        data: JSON.parse('{"pid":1024,"info":{"name":"Project Name","cost":0.99}}')
      )
      found = Document.containing({info:{name:"Project Name"}}).last
      expect(found).to eq(document)
    end
  end

  describe ".containing_text" do
    it "data path containing text" do
      document = Document.create!(
        url: "http://example.com",
        data: JSON.parse('{"pid":1024,"info":{"name":"Another","cost":0.99}}')
      )
      found = Document.containing_text({info:{name:"Other"}}).last
      expect(found).to eq(document)
    end
  end

  describe ".containing_values" do
    it "data path containing values" do
      document = Document.create!(
        url: "http://example.com",
        data: JSON.parse('{"info":{"tags":{"tag0":"foo","tag1":"bar"}},"description":"foobar"}')
      )
      found = Document.containing_values({info:{tags:["bar"]}}).last
      expect(found).to eq(document)
    end
  end
end
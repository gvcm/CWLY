require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  describe "GET #index" do
    let(:documents) do
      20.times.map do
        Document.create!(
          url: "http://example-#{rand(100..999)}.com",
          data: {name:"Test #{rand(100..999)}"}.to_json
        )
      end
    end
    
    it "return a list of recent documents" do
      @documents = documents
      get :index, format: :json
      parsed = JSON.parse(response.body)
      expect(parsed).to be_an_instance_of Hash
      expect(parsed.has_key? "documents").to be true
      expect(parsed["documents"].length).to eq(10)
    end

    it "list documents containing string" do
      @documents = documents
      5.times do
        document = @documents.shuffle.first
        document["data"]["name"] = "special"
        document.save
      end
      get :index, format: :json, qs: {name:"special"}.to_json
      parsed = JSON.parse(response.body)
      documents = parsed["documents"]
      special = documents.map { |d| d["data"]["name"] }.uniq.shift
      expect(special).to eq("special")
    end

    it "list document containing values" do
      @documents = documents
      5.times do
        document = @documents.shuffle.first
        document["data"]["tags"] = {"t1": "a", "t2": "b"}
        document.save
      end
      get :index, format: :json, qv: {tags:["a", "b"]}.to_json
      parsed = JSON.parse(response.body)
      documents = parsed["documents"]
      tags = documents.map { |d| d["data"]["tags"].values }.uniq.shift
      expect(tags).to eq(["a", "b"])
    end

  end

end

require "spec_helper"

RSpec.describe TotalvoiceRuby::Sms do
  describe "POST create" do
    let(:sms_json) { File.read("spec/fixtures/sms/created.json") }
    before do
      @message = "Rspec test"
      @destination_number = "12123456789"
      stub_request(:post, "https://api.totalvoice.com.br/sms?access_token=1234")
      .to_return(status: 200, body: sms_json)
    end

    it "Returns success" do
      sms = TotalvoiceRuby::Sms.new("1234")
      response = sms.create(@destination_number, @message)
      expect(response["status"]).to eq(200)
      expect(response["sucesso"]).to eq(true)
      expect(response["mensagem"]).to eq(@message)
    end
  end

  describe "GET retrieve" do
    let(:sms_json) { File.read("spec/fixtures/sms/retrieved.json") }
    before do
      @id = "123456"
      stub_request(:get, "https://api.totalvoice.com.br/sms/#{@id}?access_token=1234")
      .to_return(status: 200, body: sms_json)
    end

    it "Returns sms with success" do
      sms = TotalvoiceRuby::Sms.new("1234")
      response = sms.retrieve(@id)
      expect(response["status"]).to eq(200)
      expect(response["sucesso"]).to eq(true)
      expect(response["mensagem"]).to eq("dados retornados com sucesso")
    end
  end
end

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

    it "Api response == 200" do
      sms = TotalvoiceRuby::Sms.new("1234")
      response = sms.create(@destination_number, @message)
      expect(response["status"]).to eq(200)
      expect(response["sucesso"]).to eq(true)
      expect(response["mensagem"]).to eq(@message)
    end
  end
end

require "totalvoice_ruby/version"
require "rest-client"
require "json"

module Totalvoice
  class Sms
    def initialize(access_token)
      @acces_token = access_token
      @url = "https://api.totalvoice.com.br/sms?access_token=#{@acces_token}"
    end

    def create destination_number, message, user_reponse = false, mult_sms = false
      result = RestClient.post @url, {  numero_destino: destination_number,
                                        mensagem: message,
                                        resposta_usuario: user_reponse,
                                        multi_sms: mult_sms }
      JSON.parse(result)
    end
  end
end

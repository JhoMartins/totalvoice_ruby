module TotalvoiceRuby
  class Sms < TotalvoiceRuby::Base
    def create destination_number, message, user_reponse = false, mult_sms = false
      params = { numero_destino: destination_number,
                 mensagem: message,
                 resposta_usuario: user_reponse,
                 multi_sms: mult_sms }

      url = @@base_uri
      url += "/sms?access_token=#{@access_token}"

      result = send_post_request url, params
      JSON.parse(result)
    end
  end
end

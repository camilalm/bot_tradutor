module TranslatorModule
  class TranslateService
    def initialize(params)
      @text = params['text']
      @lang = params['lang'] || 'pt-en'
    end

    def call
      return 'Palavra Obrigatória' unless @text
      translate_api_url = ENV['yandex_translate_api_url']
      translate_api_key = ENV['yandex_translate_api_key']
      url = "#{translate_api_url}/translate?key=#{translate_api_key}&lang=#{@lang}&text=#{@text}"
      res = RestClient.get url
      res_text = JSON.parse(res.body)['text'][0]
      (res_text && !res_text.blank?)?  "*Tradução* \n\n #{res_text}" : "Nada encontrado"
    end
  end
end

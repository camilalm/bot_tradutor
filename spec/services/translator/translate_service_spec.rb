require_relative './../../spec_helper.rb'

describe TranslatorModule::TranslateService do
  describe '#call' do
    context "Without text params" do
      it "will receive a error" do
        @translateService = TranslatorModule::TranslateService.new({})
        response = @translateService.call()
        expect(response).to match("Palavra Obrigatória")
      end
    end

    context "With Valid params" do
      it "Returns the translated word when searched" do
        @translateService = TranslatorModule::TranslateService.new({ 'text' => 'livro' })
        @response = @translateService.call()
        expect(@response).to eql("*Tradução* \n\n book")
      end
    end
  end
end

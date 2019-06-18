RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, /translate.yandex.net/ )
    .with(headers: {
      'Accept'=>'*/*'
    }).to_return(status: 200, body: '
      {
        "lang": "pt-br",
        "text": [
          "book"
        ]
      }', headers: {})
  end
end

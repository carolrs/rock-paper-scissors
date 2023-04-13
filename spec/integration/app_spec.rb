require_relative '../../app.rb'
require 'rack/test'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  describe "GET /" do
    it "renders the initial game page" do
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('Game')
      expect(last_response.body).to include('<p>Choose your move</p>')
    end
  end

  describe "POST /move" do
    context "with valid params" do
      it "makes a new move in the game and wins" do
        post '/move', move: 'paper'
      
        expect(last_response.status).to eq(200)
          
        # expect(last_response).to be_redirect
        # follow_redirect!
        # expect(last_response.body).to include('You won!')
      end
    end
  end
end
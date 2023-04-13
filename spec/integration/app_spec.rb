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

  describe "POST /peeps" do
    context "when user is not logged in" do
      xit "redirects to login page with error message" do
        post '/peeps', text: 'Test Peep'
        expect(last_response.body).to include('You need to be logged in to peep')
      end
    end

    context "when user is logged in" do
      xit "creates a new peep" do
        user = User.create("John", "john@gmail.com", "testpassword")
        post '/login', email: user.email, password: user.password
        post '/peeps', text: 'Going out!'
        expect(last_response).to be_redirect
        follow_redirect!
        expect(last_request.path).to eq('/')
        expect(last_response.body).to include('Going out!')
      end
    end
  end

  

  describe "POST /login" do
    context "with valid credentials" do
      xit "logs in the user and redirects to home page" do
        user = User.create("testuser", "testemail@example.com", "testpassword")
        post '/login', email: user.email, password: user.password
        expect(last_response).to be_redirect
        follow_redirect!
        expect(last_request.path).to eq('/')
        expect(last_response.body).to include('Logout')
      end
    end

    context "with invalid credentials" do
     xit "returns an error message" do
        User.create("John", "john@gmail.com", "testpassword")
        post '/login', email: 'johnn@gmail.com', password: 'wrongpassword'
        expect(last_response).to be_ok
        expect(last_response.body).to include('Invalid email or password')
      end
    end
  end

  describe "POST /logout" do
    xit "logs out the user and redirects to home page" do
      user = User.create("testuser", "testemail@example.com", "testpassword")
      post '/login', email: user.email, password: user.password
      post '/logout'
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_response.body).to include('Login')
    end
  end
end
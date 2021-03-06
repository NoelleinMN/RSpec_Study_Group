require "rack/test"
require "json"
require_relative "../../app/api"

module ExpenseTracker
  RSpec.describe "Expense Tracker API" do
    include Rack::Test::Methods

    def app
      ExpenseTracker::API.new
    end

    it "records submitted expenses" do
      pending "Need to persist expenses"

      coffee = post_expense(
        "payee" => "Starbucks",
        "amount" => 5.75,
        "date" => "2022-02-02"
      )

      zoo = post_expense(
        "payee" => "Zoo",
        "amount" => 15.25,
        "date" => "2022-02-02"
      )

      groceries = post_expense(
        "payee" => "Whole Foods",
        "amount" => 95.20,
        "date" => "2022-02-16"
      )

      get "/expenses/2022-02-02"
      expect(last_response.status).to eq(200)

      expect(json_response).to contain_exactly(coffee, zoo)
    end

    def post_expense(expense)
      post "/expenses", JSON.generate(expense)
      expect(last_response.status).to eq(200)

      expect(json_response).to include("expense_id" => a_kind_of(Integer))
      expense.merge("id" => parsed["expense_id"])
    end
  end
end

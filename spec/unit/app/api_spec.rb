require_relative "../../../app/api"

module ExpenseTracker
  RSpec.describe API do
    describe "POST /expensese" do
      context "when the expense is successfully recorded" do
        it "returns the expense id"
        it "responds with a 200 (OK)"
      end

      context "when the expense fails validation" do
        it "returns an error message"
        it "responds with a 422 (Unprocessed entity)"
      end
    end
  end
end

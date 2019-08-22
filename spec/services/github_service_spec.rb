require 'rails_helper'

RSpec.describe GithubService do
  context "instance methods" do
    context "#users_repos" do
      it "returns specific users data" do
        user = create(:user, token: ENV['GITHUB_API_KEY'])
        search = subject.users_repos(user)
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        expect(search[:results].count).to eq 7
        user_data = search[:results].first

        expect(user_data).to have_key :id
        expect(user_data).to have_key :name
        expect(user_data).to have_key :url
        expect(user_data).to have_key :html_url
      end
    end
  end
end

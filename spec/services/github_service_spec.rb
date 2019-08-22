require 'rails_helper'

RSpec.describe GithubService do
  context "instance methods" do
    context "#users_repos" do
      it "returns specific users data" do
        VCR.use_cassette('github/dashboard', record: :new_episodes) do

          repos = subject.users_repos(5)
          expect(repos).to be_a Array
          expect(repos.count).to eq 5
          user_data = repos.first

          expect(user_data).to have_key :id
          expect(user_data).to have_key :name
          expect(user_data).to have_key :url
          expect(user_data).to have_key :html_url
        end
      end
    end
  end
end

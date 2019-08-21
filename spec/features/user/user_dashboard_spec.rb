require 'rails_helper'

RSpec.describe "Dashboard page" do
  describe "as a logged in user" do
    describe "when I visit the dashboard" do
      it "I see a list of repos" do
        user = create(:user, token: ENV['GITHUB_API_KEY'])
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        VCR.use_cassette('github/dashboard', record: :new_episodes) do
          visit dashboard_path

          within ".github" do
            expect(page).to have_link("apollo_14-1")
            expect(page).to have_link("backend_prework")
            expect(page).to have_link("battleship")
            expect(page).to have_link("blogger")
            expect(page).to have_link("boat_rental")
            expect(page).to_not have_link("1903_final")
          end
        end
      end
    end
  end
end

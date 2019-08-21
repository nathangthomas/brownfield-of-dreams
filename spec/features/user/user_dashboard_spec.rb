require 'rails_helper'

RSpec.describe "Dashboard page" do
  describe "as a logged in user" do
    describe "when I visit the dashboard" do
      it "I see a list of repos" do
        user = create(:user, token: ENV['GITHUB_API_KEY'])
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        # VCR.use_cassette('github/dashboard', record: :new_episodes) do
          WebMock.allow_net_connect!
          # VCR.eject_cassette
          VCR.turn_off!

          visit dashboard_path

          within ".github" do
            expect(page).to have_link("rails_engine")
            expect(page).to have_link("monster_shop")
            expect(page).to have_link("here-be-dragons")
            expect(page).to have_link("storedom")
            expect(page).to have_link("vending-machine-tracker-1")
          end
        # end
      end
    end
  end
end

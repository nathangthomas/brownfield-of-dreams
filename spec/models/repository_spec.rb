require 'rails_helper'

RSpec.describe Repository do
  it 'exists' do
    attrs = {
      id: 170210631,
      name: "cross_check",
      url: "https://api.github.com/users/blake-enyart",
      html_url: "https://github.com/blake-enyart"
    }

    repo = Repository.new(attrs)

    expect(repo).to be_a Repository
    expect(repo.name).to eq("cross_check")
    expect(repo.id).to eq(170210631)
    expect(repo.url).to eq("https://api.github.com/users/blake-enyart")
    expect(repo.html_url).to eq("https://github.com/blake-enyart")
  end
end

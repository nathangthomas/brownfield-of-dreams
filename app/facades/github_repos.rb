class GithubRepos

  def initialize(user)
    @user = user
  end

  def repos(repo_count)
    conn = Faraday.new(url: "https://api.github.com") do |f|
      f.headers["Authorization"] = "token " + ENV["GITHUB_API_KEY"]
      f.adapter Faraday.default_adapter
    end

    response = conn.get("/user/repos")
    user_repos = JSON.parse(response.body, symbolize_names: true)
    require 'pry';binding.pry
    # x = user_repos.map { |repo| Repository.new(repo) }
  end

  private
  attr_reader :user
end

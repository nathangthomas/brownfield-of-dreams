class GithubRepos

  def initialize(current_user)
    @user = current_user
  end

  def repos(repo_count)
    conn = Faraday.new(url: "https://api.github.com") do |f|
      f.headers["Authorization"] = "token " + ENV["GITHUB_API_KEY"]
      f.adapter Faraday.default_adapter
    end

    response = conn.get("/user/repos")
    user_repos = JSON.parse(response.body, symbolize_names: true)
    all_repos = user_repos.map { |repo| Repository.new(repo) }
  end

  private
  attr_reader :user
end

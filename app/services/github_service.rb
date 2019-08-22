class GithubService

  def users_repos(repo_count)
    response = conn.get("/user/repos")
    all_repos = JSON.parse(response.body, symbolize_names: true)
    all_repos.take(repo_count)
  end

  private
  def conn
    Faraday.new(url: "https://api.github.com") do |f|
      f.headers["Authorization"] = "token " + ENV["GITHUB_API_KEY"]
      f.adapter Faraday.default_adapter
    end
  end
end

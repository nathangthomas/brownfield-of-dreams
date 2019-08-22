class GithubReposFacade

  def initialize(current_user)
    @user = current_user
  end

  def repos
    service = GithubService.new
    service.users_repos(repo_count).map { |repo| Repository.new(repo)}




    # all_repos = user_repos.map { |repo| Repository.new(repo) }
    # all_repos.drop(repo_count)
  end

  private
  attr_reader :user
end

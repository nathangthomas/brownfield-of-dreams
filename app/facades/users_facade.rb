class UsersFacade

  def initialize(current_user)
    @user = current_user
  end

  def repos
    require 'pry';binding.pry
    service = GithubService.new
    service.users_repos(repo_count).map { |repo| Repository.new(repo)}




    # all_repos = user_repos.map { |repo| Repository.new(repo) }
  end

  private
  attr_reader :user
end

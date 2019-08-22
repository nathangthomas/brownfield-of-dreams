class UsersFacade

  def initialize(current_user)
    @user = current_user
  end

  def repos
    service = GithubService.new
    service.users_repos(repo_count).map { |repo| Repository.new(repo)}
  end

  private
  attr_reader :user
end

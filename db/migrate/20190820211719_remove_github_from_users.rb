class RemoveGithubFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :github_email, :string
    remove_column :users, :github_auth, :string
  end
end

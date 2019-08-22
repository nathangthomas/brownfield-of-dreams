class User < ApplicationRecord
  has_many :user_videos
  has_many :videos, through: :user_videos

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :first_name
  enum role: [:default, :admin]
  has_secure_password 

  # def github_repos
  #   Merchant.select("merchants.*, count(invoices.merchant_id) as merchant_count").joins(invoices: :transactions).where(invoices: {customer_id: id }).where("transactions.result = ?", "success").group("merchants.id").order("merchant_count desc").first
  # end

end

class Repository
  attr_reader :id, :name, :url, :html_url

  def initialize(attrs = {})
    @id = attrs[:id]
    @name = attrs[:name]
    @url = attrs[:url]
    @html_url = attrs[:html_url]
  end

end

module JsonHelper
  def json
    JSON.parse(response.body, symbolize_names: true)
  end
end

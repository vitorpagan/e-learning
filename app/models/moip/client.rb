class Moip::Client
  def self.adapter
    Faraday.default_adapter
  end

  def get(path, params = {})
    p "#{path} - #{params}"
    connection.get(path, params) do |request|
      request.headers['Authorization'] = Rails.application.secrets.moip['authorization']
    end
  end

  def post(path, params = {}, body)
    p "#{path} - #{body} - #{params}"
    connection.post(path, params) do |request|
      request.headers['Content-Type'] = 'application/json'
      request.headers['Authorization'] = Rails.application.secrets.moip['authorization']
      request.body = body
    end
  end

  def put(path, params = {}, body)
    p "#{path} - #{body} - #{params}"
    connection.put(path, params) do |request|
      request.headers['Content-Type'] = 'application/json'
      request.headers['Authorization'] = Rails.application.secrets.moip['authorization']
      request.body = body
    end
  end

  def create_user(body)
    self.post('/assinaturas/v1/customers?new_vault=true', {}, body)
  end

  def create_subscription(body)
    self.post('/assinaturas/v1/subscriptions', {}, body)
  end

  def update_billing_infos(code, body)
    self.put("/assinaturas/v1/customers/#{code}/billing_infos", {}, body)
  end

  private

  def connection
    @connection ||= Faraday.new(Rails.application.secrets.moip['url']) do |builder|
      builder.response :json, content_type: /\bjson$/
      builder.response :raise_error

      builder.adapter(*Moip::Client.adapter)
    end
  end
end

Rack::Builder.new do
  use Rack::Session::Cookie, :secret => "1234567890"

  use Warden::Manager do | manager |
    manager.default_strategies :bcrypt
    manager.failure_app = NotWrittenYet
  end
end

Warden::Manager.serialize_into_session { | user | user.id }
Warden::Manager.serialize_from_session { | id | User.get(id) }

Warden::Strategies.add(:bcrypt) do
  def valid?
    params[:username] || params[:password]
  end

  def authenticate!
    return fail! unless user = User.first(:username == params[:username])

    if user.password == params[:password]
      success!(user)
    else
      fail!
    end
  end
end
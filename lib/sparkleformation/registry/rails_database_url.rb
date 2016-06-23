#
# Produces Rails-style DATABASE_URL string
#
# Usage:
#
#   registry!(:rails_database_url,
#              adapter: 'mysql2',
#              host: ref!(:db_address),
#              port: 3306,
#              database: ref!(:db_name),
#              username: 'foo',
#              password: 'bar')
#
# This is Fn-safe, that is produces the following:
#
# { "Fn::Join": [
#   "",
#   [
#     "mysql2", "://", "foo", ":", "bar",
#     {
#       "Ref": "DbAddress"
#     },
#     ":", "3306", "/",
#     {
#       "Ref": "DbName"
#     }
#   ]
# ]}
#
#
SfnRegistry.register(:rails_database_url) do |args={}|
  if !args[:host]
    raise!("Parameter :host is required. You passed #{args.inspect}")
  end

  if !args[:port]
    raise!("Parameter :port is required. You passed #{args.inspect}")
  end

  if !args[:database]
    raise!("Parameter :database is required. You passed #{args.inspect}")
  end

  if !args[:adapter]
    raise!("Parameter :adapter is required. You passed #{args.inspect}")
  end

  if !args[:username]
    raise!("Parameter :username is required. You passed #{args.inspect}")
  end

  if !args[:password]
    raise!("Parameter :password is required. You passed #{args.inspect}")
  end

  host = args.delete(:host)
  port = args.delete(:port)
  database = args.delete(:database)
  adapter = args.delete(:adapter)
  username = args.delete(:username)
  password = args.delete(:password)

  result = [adapter, '://']

  if username && password
    result += [username, ':', password, '@']
  end

  result += [ host, ':', port, '/', database]

  first = true
  args.each do |k,v|
    if first
      result << '?'
      first = false
    else
      result << '&'
    end
    result += [k, '=', v]
  end

  join!(*result)
end

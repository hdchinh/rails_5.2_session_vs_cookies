require 'cgi'
require 'active_support'

def verify_and_decrypt_session_cookie(cookie, secret_key_base = Rails.application.secret_key_base)
  cookie = CGI::unescape(cookie)
  salt   = 'authenticated encrypted cookie'
  encrypted_cookie_cipher = 'aes-256-gcm'
  serializer = ActiveSupport::MessageEncryptor::NullSerializer

  key_generator = ActiveSupport::KeyGenerator.new(secret_key_base, iterations: 1000)
  key_len = ActiveSupport::MessageEncryptor.key_len(encrypted_cookie_cipher)
  secret = key_generator.generate_key(salt, key_len)
  encryptor = ActiveSupport::MessageEncryptor.new(secret, cipher: encrypted_cookie_cipher, serializer: serializer)

  encryptor.decrypt_and_verify(cookie)
end

cookie = "UQSQcmC6terf5AQ%3D--6%2Fd%2BTsPAj4xmEwwv--4EY%2BNkA1cjwG%2Fkbaz072EQ%3D%3D"
cookie_session = "0KwV7r5nOpElj63jb%2BQm0NloCAcW0EkPPEZstQWwCI2550WZShSWFl4XITtM1uVx9GxiuuM%2B%2BT73GIWcH1Zdr7mNrKMktn%2F8YLv8NZQZbhIMMeKbOp%2Fv3nY9b4KHIxElyOGisok3BgUEG79W9M1%2Bgc1N9QyN%2BcLnvTiyN108R5Yp2CyU--5NXVnq6sEK8oKsFa--NKdr4oR7EZMVr5Ot4Q8%2B%2Bw%3D%3D"
puts verify_and_decrypt_session_cookie(cookie_session, "2887c420fb655eb48d6647498d65e0a31a7e10482bd2b953e2801f67d8bc9be6e525edfd2065bb8b6048d9dd1be812f6ec223857a04812fba575e56ab6f0247e")

class Usuario < ActiveRecord::Base

  def self.authenticate(username, password)
		usuario = self.where(:username => username).first
		if usuario
			given_passwd = Usuario.encrypt_password(password)
			if usuario.password != given_passwd
				usuario = nil
			end
		end
		return usuario
	end

	private

		def self.encrypt_password(password)
			string = password + "1t3sM"
			Digest::SHA1.hexdigest(string)
		end

end

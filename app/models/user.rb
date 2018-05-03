class User < ApplicationRecord
	def self.setPuntaje(id)
		@user = User.find(id)
  	puntaje = @user.score
  	puntaje = puntaje+1
  	@user.update(:score => puntaje)
  end

  def self.setEstado(id)
		@user = User.find(id)
  	@user.update(:status => false)
  end
end

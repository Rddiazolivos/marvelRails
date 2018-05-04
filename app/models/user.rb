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

  def self.revivirAll
    @users = User.all
    @users.each do |user|
      user.update(:status => true)
    end    
  end

  def self.resetAll
    @users = User.all
    @users.each do |user|
      user.update(:score => 0)
    end    
  end
end

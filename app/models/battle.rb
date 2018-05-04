class Battle < ApplicationRecord
	belongs_to :user
	belongs_to :character

	def self.resultado
		random_boolean = [true, false].sample
	end

	def self.getCharacterBattle
		personaje = Battle.last
	    if personaje.nil?
	      code = Character.first
	      code = code.id
	    else
	      code = personaje.character_id
	      code = code +1
	    end
		return code
	end

	def self.rondaBatallas
		@users = User.all
		@users.each do |usuario|
	    #Valida que el usuario pueda luchar
	    if !usuario.status
	      next
	    end
	    resultado = true
	    while resultado
	    	battle = Battle.new
		    battle.user_id = usuario.id
		    battle.result = Battle.resultado	    
		    battle.character_id = getCharacterBattle
		    if battle.result 
		    	User.setPuntaje(usuario.id)
		    else
		      User.setEstado(usuario.id)
		    end
		    battle.save
		    resultado = battle.result
	    end	    
		end    
	end
end

class Battle < ApplicationRecord
	belongs_to :user
	belongs_to :character

	def self.resultado
		random_boolean = [true, false].sample
	end

	def self.getCharacterBattle
		ultimaBatalla = Battle.last
		if ultimaBatalla.nil?
			ultimoCharacter = -1
		else
			ultimoCharacter = ultimaBatalla.code_character
		end
		
		fin = Character.getCantidadCharacter
		if ultimoCharacter < fin
			personaje = Character.getDataMarvel(ultimoCharacter +1, 1)
		end
		return personaje
	end
end

require 'digest/md5'
class Character < ApplicationRecord
	include HTTParty
	def self.getDataMarvel(offsetCal, cantidad)
		query = { 
      "limit"       => cantidad,
      "offset"      => offsetCal,
      "apikey"      => 'c290f2f4d5816c7da871c60303b10a9c',
      "ts"          => '1',
      "hash"        => Digest::MD5.hexdigest('14a3d0f1b2198c665b8143755d81a1c25f40899f9c290f2f4d5816c7da871c60303b10a9c'),
    }
    response = HTTParty.get("https://gateway.marvel.com:443/v1/public/characters", :query => query , format: :json)
  end

  def self.getCantidadCharacter
  	response = getDataMarvel(0,1)
  	cantidad = response.parsed_response['data']['total'] 
  	return cantidad
  end

  def self.saveData
    #Para saber si contiene datos y si los posee los borra
    tabla = Character.count
    if tabla > 0
      Character.delete_all
    end
    datos = []
    fin = getCantidadCharacter
    inicio = 0
    #La api permite obtener solo 100 registros por consulta
    while inicio <= fin
      response = getDataMarvel(inicio, 100)
      datos= datos + response.parsed_response['data']['results']
      inicio = inicio +100
    end    
    datos.each do |single|
      character = Character.new
      character.code = single['id']
      character.name = single['name']
      character.save
    end
  end

  def self.getCharacter(codigo)
    query = { 
      "apikey"      => 'c290f2f4d5816c7da871c60303b10a9c',
      "ts"          => '1',
      "hash"        => Digest::MD5.hexdigest('14a3d0f1b2198c665b8143755d81a1c25f40899f9c290f2f4d5816c7da871c60303b10a9c'),
    }
    response = HTTParty.get("https://gateway.marvel.com:443/v1/public/characters/"+codigo, :query => query , format: :json)
  end

end

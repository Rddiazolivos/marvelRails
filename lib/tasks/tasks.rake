namespace :tasks do
  desc "Inicia la ronda de batallas"
  task startBattle: :environment do
  	Battle.rondaBatallas
  end

  desc "TODO"
  task reinicio: :environment do
  	User.revivirAll
  	User.resetAll
  end

end

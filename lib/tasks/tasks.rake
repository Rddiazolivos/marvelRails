namespace :tasks do
  desc "TODO"
  task startBattle: :environment do
  	Battle.rondaBatallas
  end

end

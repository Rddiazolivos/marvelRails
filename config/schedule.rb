every 10.minutes do
	rake "tasks:startBattle"	
end

every :day, :at => '00:00 am' do
  rake 'tasks:reinicio'
end
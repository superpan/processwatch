#License: (MIT), Copyright (C) 2013 Author Phil Chen.

ps_list = `ps h -eo cmd`

dir = File.dirname(__FILE__)
Dir[File.expand_path("#{dir}/conf/restart_*")]. uniq. each do |file|

	load file

	list = ps_list.split(/\n/)

	occurances = list.grep(/.*#$restart_process.*/)
	if occurances.length == 0

		system $restart_action

	end
end

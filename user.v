module main

import vweb
import users as u { new_user_service }

['/users']
pub fn (mut app App) users() vweb.Result {
	user_service := new_user_service(app.db)
	users := user_service.get_all()

	return $vweb.html()
}

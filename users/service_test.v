module users

import sqlite

fn test_create_user() {
	mut database := sqlite.connect(':memory:') or { panic(err) }

	defer {
		database.close() or { panic(err) }
	}

	create_users_table(database)

	user_service := new_user_service(database)
	user_service.create('test')
	users := user_service.get_all()
	user := users.first()

	assert users.len == 1
	assert user.username == 'test'
	assert user.id == 1
}

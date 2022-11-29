module users

import sqlite

[noinit]
pub struct UserService {
	database sqlite.DB
}

pub fn new_user_service(database sqlite.DB) UserService {
	return UserService{
		database: database
	}
}

pub fn create_users_table(database sqlite.DB) {
	sql database {
		create table User
	}
}

pub fn (service UserService) create(username string) {
	new_user := User{
		username: username
	}

	sql service.database {
		insert new_user into User
	}
}

pub fn (service UserService) get_all() []User {
	return sql service.database {
		select from User
	}
}

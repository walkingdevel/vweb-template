module main

import vweb
import orm
import db.sqlite
import users { create_users_table }

struct App {
	vweb.Context
pub mut:
	db orm.Connection
}

fn main() {
	app := &App{
		db: sqlite.connect('concept.sqlite') or { panic(err) }
	}

	create_tables(app.db)

	vweb.run_at(app, vweb.RunParams{
		port: 8080
	}) or { panic(err) }
}

fn create_tables(database orm.Connection) {
	create_users_table(database)
}

module main

import vweb
import sqlite
import users { create_users_table }

struct App {
	vweb.Context
pub mut:
	database sqlite.DB
}

fn main() {
	app := &App{
		database: sqlite.connect('concept.sqlite') or { panic(err) }
	}

	create_tables(app.database)

	vweb.run_at(app, vweb.RunParams{
		port: 8080
	}) or { panic(err) }
}

fn create_tables(database sqlite.DB) {
	create_users_table(database)
}

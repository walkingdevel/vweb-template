module users

pub struct User {
pub:
	id       int    [primary; sql: serial]
	username string
}

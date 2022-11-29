module users

pub fn (u User) format_username() string {
	return '@${u.username}'
}

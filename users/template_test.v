module users

fn test_format_username() {
	user := User{
		username: 'test'
	}

	assert user.format_username() == '@test'
}

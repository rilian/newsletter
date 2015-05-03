manager = Manager.find_or_create_by(email: 'manager@example.com')
manager.update(password: 'change_me_in_production')

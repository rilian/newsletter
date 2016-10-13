# frozen_string_literal: true
manager = Manager.find_or_create_by(email: ENV['MANAGER_EMAIL'])
manager.update(password: ENV['MANAGER_PASSWORD'])

Kaminari.configure do |config|
  config.default_per_page = (ENV['ITEMS_PER_PAGE'] || 50).to_i
end

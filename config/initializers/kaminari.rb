Kaminari.configure do |config|
  config.default_per_page = ENV['ITEMS_PER_PAGE'].to_i
end

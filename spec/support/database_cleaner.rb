require 'database_cleaner-mongoid'
RSpec.configure do |config|    
  # start by truncating all the tables but then use the faster transaction strategy the rest of the time.
  config.before(:suite) do
    DatabaseCleaner.clean_with(:deletion)
    DatabaseCleaner.strategy = :deletion
    FileUtils.rm_rf(Rails.root.join('tmp', 'storage'))
  end

  # start the transaction strategy as examples are run
  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
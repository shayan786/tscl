namespace :db do
  desc 'Pull production db to development'
  task :pull => [:dump, :restore]

  task :dump do
    dumpfile = "#{Rails.root}/tmp/latest.dump"
    puts 'PG_DUMP on production database...'
    system "ssh deploy@198.199.107.13 'PGPASSWORD=\"tscl_password\" pg_dump -U tscl tscl_production -h 198.199.107.13 -F t' > #{dumpfile}"
    puts 'Done!'
  end

  task :restore do
    dev = Rails.application.config.database_configuration['development']
    dumpfile = "#{Rails.root}/tmp/latest.dump"
    puts 'PG_RESTORE on development database...'
    system "pg_restore --verbose --clean --no-acl --no-owner -h 127.0.0.1 -d #{dev['database']} #{dumpfile}"
    puts 'Done!'
  end
end
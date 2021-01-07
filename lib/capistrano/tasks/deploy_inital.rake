

namespace :deploy do
  desc "Performs first deploy to a server"
  task :initial do
    before "deploy:migrate", "deploy:create_db"
    invoke "deploy"
  end

  task :seed do
    on roles(:db) do
    within release_path do
      with rails_env: fetch(:rails_env) do
        execute :rake, "db:seed"
      end
    end
    end
  end

  desc "Runs rails db:setup"
  task :create_db do
    on roles(:db) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:create"
        end
      end
    end
  end

end
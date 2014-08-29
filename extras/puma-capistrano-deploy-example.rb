# https://github.com/puma/puma/issues/539
# https://gist.github.com/allaire/97221660f058551c0c5f

namespace :load do
  task :defaults do
    set :puma_init_ident, "#{fetch(:domain).gsub('.', '-')}-puma"
    set :puma_pid_path, "#{shared_path}/tmp/pids/puma.pid"
  end
end

namespace :puma do
  desc 'Phased-restart Puma if possible'
  task :phased_restart do
    on roles(:app) do
      within current_path do
        if test("[ -f #{fetch :puma_pid_path} ]") && test("kill -0 $( cat #{fetch :puma_pid_path} )")
          execute :bundle, :exec, :pumactl, '-P tmp/pids/puma.pid', 'phased-restart'
        else
          invoke 'puma:start'
        end
      end
    end
  end
  after 'deploy:published', 'puma:phased_restart'

  desc 'Hot-restart Puma if possible'
  task :hot_restart do
    on roles(:app) do
      within current_path do
        if test("[ -f #{fetch :puma_pid_path} ]") && test("kill -0 $( cat #{fetch :puma_pid_path} )")
          execute :bundle, :exec, :pumactl, '-P tmp/pids/puma.pid', 'restart'
        else
          invoke 'puma:start'
        end
      end
    end
  end

  desc 'Start Puma'
  task :start do
    on roles(:app) do
      sudo "initctl start #{fetch :puma_init_ident}"
    end
  end

  desc 'Stop Puma'
  task :stop do
    on roles(:app) do
      sudo "initctl stop #{fetch :puma_init_ident}"
    end
  end

  desc 'Restart Puma'
  task :restart do
    on roles(:app) do
      sudo "initctl restart #{fetch :puma_init_ident}"
    end
  end

  desc 'Reload Puma'
  task :reload do
    on roles(:app) do
      sudo "initctl reload #{fetch :puma_init_ident}"
    end
  end
end

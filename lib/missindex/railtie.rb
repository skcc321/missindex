module Missindex
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load 'tasks/missindex_tasks.rake'
    end
  end
end

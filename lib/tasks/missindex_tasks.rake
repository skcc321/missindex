namespace :missindex do
  task regenerate: :environment do
    File.open("db/migrate/#{Time.now.strftime('%Y%m%d%H%M%S')}_missindex_refresh.rb", 'w') do |f|
      items = ActiveRecord::Base.connection.tables.flat_map do |table|
        ActiveRecord::Base.connection.indexes(table).map do |index|
          "begin add_index(:#{table}, #{index.columns}, name: :#{index.name}); rescue => e; puts(e); end"
        end
      end

      content = <<~HEREDOC
        class MissindexRefresh < ActiveRecord::Migration[5.2]
          def change
            #{items.join("\n    ")}
          end
        end
      HEREDOC

      f.write(content)
    end
  end
end

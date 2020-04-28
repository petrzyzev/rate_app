# frozen_string_literal: true

class Storage
  FILE_PATH = Rails.root.join('data.yml')

  def self.rate_data
    if File.zero?(FILE_PATH) || !File.exist?(FILE_PATH)
      {}
    else
      YAML.load_file(FILE_PATH)
    end
  end

  def self.save_to_file(new_data)
    current_data = rate_data.merge(new_data)
    File.open(File.expand_path(FILE_PATH), 'w') do |f|
      f.write(current_data.to_yaml)
    end
  end
end

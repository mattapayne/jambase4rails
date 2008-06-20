asset_dir = File.join(File.dirname(__FILE_), "assets")
rails_image_dir = File.join(RAILS_ROOT, "public", "images")

Dir[asset_dir].each do |file|
  destination_file = File.join(rails_image_dir, File.basename(file))
  unless File.exists?(destination_file)
    File.copy(file, destination_file)
    puts "Copied #{file} to #{destination_file} as a part of the JamBase4Rails install process."
  else
    puts "#{destination_file} already exists. Not copying."
  end
end

rails_image_dir = File.join(RAILS_ROOT, "public", "images")
asset_dir = File.join(File.dirname(__FILE_), "assets")

Dir[asset_dir].each do |file|
  destination_file = File.join(rails_image_dir, File.basename(file))
  if File.exist?(destination_file)
    File.delete(destination_file)
    puts "Deleted #{destination_file} as a part of the JamBase4Rails uninstall process."
  end
end

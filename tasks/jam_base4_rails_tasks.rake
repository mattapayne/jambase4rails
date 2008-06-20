require 'fileutils'

namespace :jambase4rails do
  
  desc "Copies all required assets to the public directory"
  task :install_assets => :environment do
    iterate_assets do |src, dest|
      unless File.exist?(dest)
        FileUtils.cp(src, dest)
        puts "Copied #{src} to #{dest}."
      end
    end
  end
  
  desc "Removes all assets installed by this plugin"
  task :uninstall_assets => :environment do
    files_to_remove = []
    iterate_assets do |src, dest|
      if File.exist?(dest)
        files_to_remove << dest
        puts "Removing #{dest}"
      end
    end
    FileUtils.rm(files_to_remove) unless files_to_remove.empty?
  end
end

def iterate_assets(&block)
 
  rails_image_dir = File.join(RAILS_ROOT, "public", "images")
  asset_dir = File.expand_path(File.join(File.dirname(__FILE__), "/../", "assets"))
    
  FileUtils.cd(asset_dir) do
    dir = Dir.new(".")
    dir.each do |f|
      if File.file?(f)
        dest = File.join(rails_image_dir, File.basename(f))
        block.call(f, dest)
      end
    end
  end
    
end

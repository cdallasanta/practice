#!/usr/bin/ruby

require 'fileutils'
require 'pry'

directory = "../../../../Desktop/Camera"

Dir.chdir(directory) do
  # move all image files from subfolders into parent directory
  Dir["**/*"].each do |file|
    File.rename file, file.gsub(/^.*\//, '')
  end

  # delete all folders, which should now be emtpy of all image files
  Dir["**/*"].select{|f| File.directory?(f)}.each do |f|
    FileUtils.rm_rf(f)
  end
end

p "Done"
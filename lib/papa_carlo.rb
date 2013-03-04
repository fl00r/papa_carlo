require "papa_carlo/version"
require "fileutils"
require "erb"

module PapaCarlo
  extend self

  def root
    @root ||= begin
      File.expand_path("../../", __FILE__)
    end
  end

  def create_project(project)
    FileUtils.mkdir_p("#{project}/lib/#{project}")
    FileUtils.mkdir_p("#{project}/config/options")
    FileUtils.mkdir_p("#{project}/spec/#{project}")
    FileUtils.mkdir_p("#{project}/spec/helpers")

    gemfile = File.join(root, "lib", "papa_carlo", "templates", "Gemfile")
    rakefile = File.join(root, "lib", "papa_carlo", "templates", "Rakefile")
    boot = File.join(root, "lib", "papa_carlo", "templates", "boot.erb")
    project_file = File.join(root, "lib", "papa_carlo", "templates", "project.erb")
    spec_helper = File.join(root, "lib", "papa_carlo", "templates", "spec_helper.rb")

    FileUtils.cp(gemfile, "#{project}/")
    FileUtils.cp(rakefile, "#{project}/")
    FileUtils.cp(spec_helper, "#{project}/spec/")

    @project_name = project
    @project_class = project.split("_").map(&:capitalize).join

    path = File.expand_path("./../../#{project}/lib/#{project}.rb", __FILE__)
    File.open(path, "w") do |f|
      f << ERB.new(File.read(project_file)).result(binding)
    end

    path = File.expand_path("./../../#{project}/config/boot.rb", __FILE__)
    File.open(path, "w") do |f|
      f << ERB.new(File.read(boot)).result(binding)
    end

    path = File.expand_path("./../../#{project}/config/options/config.yml", __FILE__)
    FileUtils.touch(path)
  end
end
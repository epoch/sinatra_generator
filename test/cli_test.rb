require 'test_helper'

class CLI < MiniTest::Unit::TestCase

  def setup
    @templates_path = "#{File.dirname(__FILE__)}/../lib/sinatra_generator/templates"
    @tmp_dir = Dir.mktmpdir
    Dir.chdir @tmp_dir
  end

  def teardown
    Dir.chdir('..')
    FileUtils.remove_entry @tmp_dir
  end

  # sinatra new blog
  def test_command_new
    SinatraGenerator::CLI.start ['new','blog']
    assert File.directory? "blog"

    Dir.chdir 'blog' do
      assert File.exist?('main.rb'), 'main.rb not found'
      assert File.exist?('Gemfile'), 'Gemfile not found'
      assert File.exist?('config.ru'), 'config.ru not found'
    end
  end

  # sinatra new blog -p
  def test_option_profile
    SinatraGenerator::CLI.start ['new','blog', '-p']
    Dir.chdir 'blog' do
      assert_equal File.read('Procfile'), File.read("#{@templates_path}/Procfile")
    end
  end

  # sinatra new blog -v
  def test_option_views
    SinatraGenerator::CLI.start ['new','blog', '-v']
    Dir.chdir 'blog' do
      assert File.directory?('views'), 'views not found'
      assert_includes File.read('main.rb'), "erb :index"
      Dir.chdir 'views' do
        assert_equal File.read('index.erb'), File.read("#{@templates_path}/index.erb")
      end
    end
  end  

  # sinatra new blog -av
  def test_option_assets_with_views
    SinatraGenerator::CLI.start ['new','blog', '-av']
    Dir.chdir 'blog' do
      assert File.directory?('public'), 'public not found'
      assert File.directory?('views'), 'views not found'

      Dir.chdir 'views' do
        assert_match /\n\s\s<link rel='stylesheet' href='\/stylesheets\/main.css'>/, File.read('layout.erb')
      end      
    end
  end  

end
namespace :deploy do

  desc 'Creates a ScGame-VERSION.app.zip on ~/Desktop'
  task :osx do
    raise "Define VERSION" unless ENV['VERSION']
    system "rm -rf /tmp/ScGame.app"
    system "cp -rf resources/ScGame.app /tmp/ScGame.app"
    system "cp -rf lib game data /tmp/ScGame.app/Contents/Resources"
    system "cp game.rb /tmp/ScGame.app/Contents/Resources/Main.rb"
    system "rm ~/Desktop/ScGame-#{ENV['VERSION']}.app.zip"
    system "cd /tmp; zip -r ~/Desktop/ScGame-#{ENV['VERSION']}.app.zip ScGame.app"
  end

  desc 'Creates a ScGame-VERSION.zip on ~/Desktop'  
  task :win do
    raise "Define VERSION" unless ENV['VERSION']
    # TODO
  end

end

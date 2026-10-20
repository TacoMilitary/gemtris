SUMMARY_TEXT = <<~SUMM.delete "\n"
This is a simple command-line Ruby recreation of the game Tetris!
SUMM

DESC_TEXT = <<~DESC.delete "\n"
Using the keys on your keyboard, manipulate a falling shape 
within a grid of cells in turn-based gameplay. Try to play for as long as 
possible without touching the top of the grid.
DESC

Gem::Specification.new do |gem|
  gem.name = 'gemtris'
  gem.version = '1.0.0'


  gem.summary = SUMMARY_TEXT
  gem.description = DESC_TEXT

  gem.author = 'TacoMilitary'
  gem.email = 'tacobuddy18@outlook.com'

  gem.files = Dir['lib/**/*.rb'] + Dir['yml/*.yml']
  gem.executable = 'gemtris'

  gem.required_ruby_version = '>= 3.2.0'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'bundler'
end

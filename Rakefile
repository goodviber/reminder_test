require "bundler/gem_tasks"
require 'pry'
require 'rspec/core'
require "rspec/core/rake_task"

task :default => :spec

RSpec::Core::RakeTask.new(:spec)

desc 'Run Reminder'
task :run do

  project_root = File.dirname(File.absolute_path(__FILE__))
  Dir.glob(project_root + '/lib/*') { |file| require file }

  reminder_rules = []
  reminder_rules << Rule.quarterly_rule('quarterly', '1 May')
  reminder_rules << Rule.twice_yearly_rule('twice_yearly', '1 May')

  estates = []
  estates << Estate.new('0066S', 'quarterly', ['1st Feb', '3rd May', '1st Aug', '5th Nov'])
  estates << Estate.new('0123S', 'quarterly', ['28th Feb', '31st May', '31st Aug', '30th Nov'])
  estates << Estate.new('0250S', 'twice_yearly', ['23rd Jan', '22nd Jun'])

  reminder = Reminder.new(reminder_rules)
  reminder.on(Date.today, estates)

end

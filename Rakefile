desc "load the prices, order, payments, and execute it all!"
task :default => [:run]

task "run" do
  $LOAD_PATH.unshift(File.dirname(__FILE__), "lib")
  require 'taxes_calculator'
  TaxesCalculator.call!
end

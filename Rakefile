require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:all, 'Runs the whole test Suite') do |t|
  begin
    t.cucumber_opts = 'features/* --format html --out=reports/all-report.html'
  rescue
  end

end


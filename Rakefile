require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:all, 'Runs the whole test Suite') do |t|
  begin
    # t.cucumber_opts = 'cucumber/* --format pretty --format json --out = reports/all-report.json'
     # rescue
    t.cucumber_opts = 'cucumber'
    sh 'cucumber --format pretty --format json --out reports/all-report.json'
  end

end


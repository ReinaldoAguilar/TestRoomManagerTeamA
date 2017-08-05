require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:all, 'Runs the whole test Suite') do |t|
  begin
    # t.cucumber_opts = 'features/* --format pretty --format json --out = reports/all-report.json'
  # rescue
    t.cucumber_opts = 'features'
    sh 'cucumber --format pretty --format json --out reports/all-report.json'
  end

end


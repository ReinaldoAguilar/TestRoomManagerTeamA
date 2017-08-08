Then(/^I expect Status code Exchange Services (\d+) for the SmokeTest$/) do |http_code|

  expect(@http_response.code.to_s).to eql(http_code)
end


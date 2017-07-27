
When(/^I send a (GET) request to Services room manager endpoint$/) do |method|
  require_relative '../../support/requests/roommanager/Services/get'
  @http_response = WorkspacesGet.call_and_return_response(@client, method)
end


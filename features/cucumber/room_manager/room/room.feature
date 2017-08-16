@room
Feature: Get room
  create room with aplication before to test  this feature

  Background:
  Given I request GET "rooms"
  When I execute the request
  Then I expect status code 200
    And I stored the reference of a services as: [room1]

  @smoke
  Scenario: Get Room if a exist the id room example

  Given I request GET "room/room1._id"
  When I execute the request
  Then I expect status code 200
    And I verify the expected schema for "room"


  Scenario: Get Room with invalid id with more to size 24

  Given I request GET "room/59825cef7bd9bc0cd453e084000"
  When I execute the request
  Then I expect status code 400

  Scenario: Get Room with invalid id the same size

  Given I request GET "room/59825cef7bd9bc0cd453e084"
  When I execute the request
  Then I expect status code 404

  Scenario: Get Room if a exist the id room an put space in blank

  Given I request GET "room/              room1._id"
  When I execute the request
  Then I expect status code 200
    And I verify the expected schema for "room"

  Scenario: Get Room if a exist the id room an change id  the letters to uppercase
#  Given I change to uppercase "room1._id"
    And I request GET "room/room1._id"
  When I execute the request
  Then I expect status code 400



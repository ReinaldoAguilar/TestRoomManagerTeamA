@room
Feature: Update Meetings

  Background: Create a Meeting
    Given I request POST "meetings" with:
      """
      {
        "organizer": "Administrator@arabitpro.local",
        "subject": "TestMeeting",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "rooms": [

        ],
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type | application/json             |
      | Credentials  | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 |
    When I execute the request
    And I stored the "_id" of the response [Meetings1]


  Scenario Outline: Update Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "organizer": <organizer>,
        "subject": "<subject>,
        "body": <body>,
        "start": <start>,
        "end": <end>,
        "rooms": [
           <rooms>
        ],
        "attendees": [
           <attendees>
        ],
        "optionalAttendees": [
           <optionalAttendees>
        ]
      }
      """
    And With the following headers:
      | Content-type | application/json             |
      | Credentials  | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 |
    When I execute the request
    Then I expect status code <code>

  Examples: Negative validation
  | organizer                       | subject | body                    | start                     | end                       | rooms     | attendees                       | optionalAttendees         | code |
  | "42342342342342342342342342342" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  |
  | " "                             | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  |
  | 4234234234234234234232342342342 | "Test"  | "Scrum of Room Manager" | "2018-10-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  |
  | "Administrator@arabitpro.local" | 4234234 | "Scrum of Room Manager" | "2017-14-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  |
  | "Administrator@arabitpro.local" | "Test"  | 42342342342342342342324 | "2017-10-40T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  |
  | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2018-10-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  |
  | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-14-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  |
  | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-40T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  |
  | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | 3123123123123123123123123 | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  |
  | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | " "                       | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  |
  | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2015-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  |
  | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2017-18-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  |
  | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2017-10-50T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  |
  | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | werwerwewerwerwerwerwerwe |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  |
  | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | " "                       |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  |
  | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" | "3534534" | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  |
  | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" | " "       | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  |
  | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "24234234234234234234234234fsd" | "stacy.hirano@server.lab" | 400  |
  | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | " "                             | "stacy.hirano@server.lab" | 400  |
  | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "53453453453453453453555" | 400  |
  | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | " "                       | 400  |




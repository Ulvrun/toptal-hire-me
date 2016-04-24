Feature: Login by user
  The user with valid e-mail and password should be able to login
  The system should not allow to login the user with incorrect e-mail or password

  Scenario Outline:
    Given User navigates to Toptal
    When button 'Login' is clicked
    And enter <email> into 'Email' text field
    And enter <password> into 'Password' text field
    And click 'Login' button
    Then error message 'Invalid email or password.' is displayed

    Examples:
      | email                         | password                            |
      |  johnsmith@gmail.com          |     42                              |
      |  i.kuznetsova90@gmail.com     |    <script>alert('Hello');</script> |
      
  Scenario:
    Given Anonymous is on 'Login' form
    When text field 'Email' is empty
    And text field 'Password' is empty
    And click 'Login' button
    Then error message 'Invalid email or password.' is displayed    

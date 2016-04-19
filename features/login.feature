Feature: Login by user
  The user with valid e-mail and password should be able to login
  The system should not allow to login the user with incorrect e-mail or password

  Scenario:
    Given User navigates to Toptal
    When button 'Login' is clicked
    And enter into 'Email' text field
    And enter into 'Password' text field
    And click 'Login' button
    Then error message 'Invalid email or password.' is displayed
Feature: View info about candidates
  In order to visualize informations that I want
  As an user
  I want to be able to visualize info about candidates


  Scenario: I'm an user and I'm on home page
    Given there is 4 candidates
    And I'm on the home page
    Then I should see "Você sabe o que faz um vereador"
    And I should see "Procure o seu candidato!"

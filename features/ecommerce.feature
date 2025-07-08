
Feature: Fluxo de compra em ecommerce-playground.lambdatest.io

  @login
  Scenario Outline: Log in with different valid credentials
    Given im in login page
    When I fill in the email "<email>" and password "<password>"
    And click on the submit button
    Then Validate the title after login
    And Validate the search products field after login

    Examples:
      | email                     | password         |
      | anatestedesafio@gmail.com | senhaenjoeiteste |

  @search
  Scenario Outline: Search for different items successfully
    Given im in home page
    When I search for the product "<product>"
    Then search results must be shown

    Examples:
      | product       |
      | Canon EOS 5D  |
      | HTC Touch HD  |

  @cart
  Scenario Outline: Add products to cart successfully
    Given im in home page
    And I search for the product "<product>"
    When I open the product "<product>"
    And I add the product to the cart
    Then I should see the product "<product>" in the cart page

    Examples:
      | product    |
      | iPod Nano  |

  @login_invalid
  Scenario Outline: Log in with invalid credentials
    Given im in login page
    When I fill in the email "<email>" and password "<password>"
    And click on the submit button
    Then invalid credentials message must be shown

    Examples:
      | email                     | password        |
      | anatestedesafio@gmail.com | sen7777joeit    |

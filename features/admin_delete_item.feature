Feature: admin can add and delete food items from menu

Background: items have been added to the database

  Given the following items exist:
  | name                   | desc        | category 	| price | food_type |
  | Tomato Soup            | organic     | Lunch		| 4     | Entree    |

Scenario: delete existing food item from menu
	Given I am a new, authenticated admin user
	Given I am on the details page for "Tomato Soup"
	Then I should see "Tomato Soup"
	When I press "Delete"
	Then I should be on the Admin Items Index page
	And I should not see "Tomato Soup"

Scenario: delete from items index page
	Given I am a new, authenticated admin user
	And I am on the Admin Items Index page
	Then I should see "Tomato Soup"
	When I press "Delete"
	Then I should be on the Admin Items Index page
	And I should not see "Tomato Soup"
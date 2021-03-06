Feature: Admin can view open orders
	As an admin
	So that I can see what orders have been requested
	I want to be able to see all open orders

Background:

	Given a "8" per person budget menu named "Bob's Menu" exists with the following items:
	  | name            | desc    | category | price | food_type  |
	  | Steak           | organic | Lunch    | 4     | Entree     |
	  | Fish            | organic | Lunch    | 4     | Entree     |

	Given a "12" per person budget menu named "Cat's Menu" exists with the following items:
	  | name            | desc    | category | price | food_type  |
	  | Deli Sandwich   | turkey  | Lunch    | 7     | Entree     |
	  | Steak           | organic | Lunch    | 4     | Entree     |
	  | Fish            | organic | Lunch    | 4     | Entree     |
	  | Fries           | organic | Lunch    | 4     | Appetizer  |	 
	  | Chicken Wings   | organic | Lunch    | 4     | Appetizer  |	 
	  | Celery          | organic | Lunch    | 4     | Side       |
  	  | Broccoli        | organic | Lunch    | 4     | Side       | 
  	  | Cake            | organic | Lunch    | 4     | Dessert    | 

	Given the following users exist:
	  | name | email         | password | password_confirmation |
	  | Bob  | bob@email.com | password | password              |
	  | Cat  | cat@email.com | password | password              |

	Given the following events exist:
	  | user                   | menu        |  event_type      | head_count |
	  | bob@email.com          | Bob's Menu  |  Cocktail Party  |     15     |
	  | cat@email.com          | Cat's Menu  |  Cocktail Party  |     20     |

	Given I am a new, authenticated admin user

Scenario:
	And I am on the Admin Events page
	And I should see "bob@email.com"
	And I should see "Cocktail Party"
	And I should see "cat@email.com"
	And I should see "Cocktail Party"

Scenario:
	And I am on the Admin Events page
	And I follow "View Bob's Order Details"
	And I should see "Budget Per Person: 8"
	And I should see "Steak" inside a menu table
	And I should see "Fish" inside a menu table



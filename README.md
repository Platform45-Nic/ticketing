# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies
  - Run 'bundle install'
* Configuration
  - N/A
* Database creation
  - Run 'rails db:drop db:create db:migrate'
* Database initialization
  - N/A
* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

# Ticketing

* Create a user model that will be used for Authentication and Authorization
* The user model needs to account for both `Normal` users and `Admin` users (Please use STI)
* All users should have the following properties: `first_name`, `last_name`, `email` and `password`
* For all users, I want to be able to `sign up`, `log in` and `sign out`

Hint: I would suggest that the admin and normal user controllers be separated.

	**Admin User**
- Please create a navbar for the admin that has the following: profile, categories, events 

* As an admin user, when signing in, I want to be redirected to my profile page
* My profile page should include my `first_name`, `last_name` and `email`
* As an admin, on my profile page, I want to see a categories link that, when clicked leads me to a Category index page - with a list of categories (if there are no Categories available, I want to see the message `There are currently no categories`)
* On the `Category` index page, I want to be able to see a `create category` button that takes me to a new category form
* The category form should have only a `name` property
* I should _not_ be able to edit, update or destroy a category
* As an admin, on my profile page, I want to see a categories link that, when clicked leads me to a Category index page - with a list of categories
* As an admin I want to see a `create event` button that leads me to a new page for an event
* As an admin, on my profile page, I want to be able to see a link that says 'events, that when clicked takes me to the events index page.
* On the events index page, I want to see a list of events. If there are no Events available, I want to see the message `There are currently no events`.
* On the events index page, I want to be able to see a `create event` button, that when clicked takes me to a new event form page.
* Event model should the following properties: `name`, `number of tickets`, `date`, `category`, `description`, `creator` - Please note:  the category property is a reference to the category model, the creator property is a reference to the user/admin mode, the description property is a text data type. Also note: On the event form I want to be able to add a price for the event but this is not added to the event but rather the tickets. (Ask if you need clarity)
* When creating an event (ie. clicking the `create` event button), I want to create the event, the price of the event and the number of tickets the event has - the tickets should be created in a service - Please chat to me about this as we have not done services). Additionally please add a validation that ensures that the date of the event is at least 1 week into the future (you may have to talk to me about this too).
* Tickets should have the following properties: `number`, `event`, `sold_originally`, `sold_on_marketplace`, on_resell`, `price`, `purchaser` - Please note: the `number` property is a string and refers to a random, unique uuid number (limit it to 10 digits), `event` is a reference to the Event model, and `sold_originally`, `sold_on_marketplace` and `on_resell` are booleans that need to be defaulted to false, `purchaser` is a reference to a normal user.
* On the Category profile page (for a particular category), I want to be able to be able to see all the events linked to that particular category (please list the name of the event, the date of the event and the the number of tickets for the event. This page should be split in two sections (1) Current Events - these are the tickets whose date is still in the future; and (2) Past Events - these are the tickets whose events are in the past.
* On the admins profile pageI want to see a link to `my_events`, on click of this link I want to be taken to an index page that lists the events that the current admin has created. Please split these up between `Current Events` and `Past Events` - on the same page.
* On the Events index page, I want to split up the `Current Events` and the `Past Events`
* On the the events show page, I want to see the name of the Event, the category of the event and the date of the event. (1) If the event is in the past, I want to see the number of tickets that have been sold for it. (2) If the event is in the future, I want to see the number of tickets that are still available (ie. number of tickets available - tickets sold)

**Normal User**
- Please create a navbar for the normal user that has the following: profile, account, events, marketplace 

* As a normal user, when `signing up`, I also want to have an Account and a AccountTransaction created (Please note the validation: `A Normal (user) has an account) but an Admin does not`). The initialisation of the account should include 100 Rand in the account.
* An Account has the following properties: `user` and `amount`. The `user` property is the reference to the `normal user` who owns the account. Please note that the account amount can not be less than 0. Also note that the account has many AccountTransactions which will sum up the amount (ie. everytime a transaction happens, the amount property of the account must be updated.
* An AccountTransaction has the following properties: `amount`, `account`, `note`. Please note `account` is a reference to the account model, `note` is a string that either has the following options: `initialization`, `ticket purchase`, `market selling`
* On creating a normal user and therefore an account, you need to create an AccountTransaction with R100 in it and the note `initialization`
* On the normal users `account` profile, I want to see a list  
* As a normal user, when `signing up` or `signing in`, I want to be redirected to the events profile page with a list of all events (by name) that are in the `future`, ordered by nearest to today to furthest. Each event name should be a clickable link to the event profile page. Next to the event title, I want to be able to see the number of tickets available (ie. 25 tickets available - if the are no tickets available, I want to see `sold out`) and when the event starts (ie. starts in 4 weeks)
* On the event profile page, I want to see the event name, the time until the event starts (ie. starts in 2 days), number of tickets available (ie. 4 tickets available - if the are no tickets available, I want to see `sold out`), below that a description of the event and below the description, a `purchase ticket(s)` button.
* On clicking the `purchase tickets(s)` button, I want to go to a purchase form that shows the event name and the number of tickets that the user wants to purchase - please create a transaction `form` that has the following properties: event, purchaser. If the user does not have enough money in their accounts to purchase their tickets, send the user back to the form with an error message that states: `Ticket cost exceeds account amount, please top up account`
* On clicking the `purchase button` for a ticket, I want: (1) To purchase the amount of tickets selected, (2) randomly select unpurchased tickets for the event and set the `sold` property to true and the purchaser reference needs to be updated with the current user, (3) create AccountTransactions with the `note`: `ticket purchase`, (3) update the user account's amount.
* As a normal user, on my profile page, I want to see my `first_name`, `last_name`, the amount of money available in my account. Below this I want to see a list of tickets (their event names and the ticket uuid) that I have purchased. These tickets should be separated between `Upcoming Events` and `Past Events`. Each ticket (for an upcoming event) should also have a button called `resell` next too it.
* On clicking the sell button, I want the ticket to move to the Marketplace but the ticket still belongs to the purchaser and no money must be debited from their account. The ticket moves to the Marketplace by changing the `on_resell` property on the ticket to `true`
* On the navbar for the normal user, I want to click on Marketplace and be redirected to the Marketplace index page with a list of events with that have tickets on resell. (scope => `sold_originally: true`, `sold_on_marketplace: false`, `on_resell: true`). Please note that this page must show the events title and the amount of tickets available). Also note, only upcoming events can be on the Marketplace (no past events)
* On the Marketplace, when I click on an event, I want to be see the event name, the time until the event starts (ie. starts in 2 days), number of tickets on resale (ie. 4 tickets on resale), below that a description of the event and below the description, a `purchase ticket(s)` button.
* On purchasing the ticket, I want to (1) change the ticket purchaser too the current user, (2) create an account transaction for the current purchaser, (3) update the current purchaser's account amount, (3) create an account transaction for the original purchaser that credits their money, (4) update the original purchaser's account amount ==> `Please look up rails transactions for this`. Also please note that the AccountTransaction (for both transaction) for this is: `market selling`.

	** API and Consumption**
- Please create an API in application (please version it). The following will describe what the consumption application must do. Please build the API with the required functionality.

* There is no sign up on the consumption application. Only sign in. This means that only users who already have an account can use the consumer app.
* As a normal user I want to sign in to the consumption app
* After signing in to the page, I always want to see a navbar with the following titles: `events` and `marketplace` 
* After signing in, I want to be redirected to a page that only shows `upcoming events` that have tickets. On this page, I want to see the name of the event, the number of tickets available in the list of events.
* On click of an event, I want to see the same details I would on the normal applications event page with a button to buy a single ticket at a time.
* On click of purchase of ticket I want to get a response that either tells me that I have purchased the ticket or that I do not have enough funds to purchase my ticket and that I must go top up my account.
* On click of the marketplace title on the navbar, I want to to see a list of events that are available on the navbar and the amount of tickets on resale.
* On click of the event I want to see the same detail I would see on the normal app for a marketplace event profile, the only difference is that I can only purchase one ticket at a time.
* On click of purchase of ticket I want to get a response that either tells me that I have purchased the ticket or that I do not have enough funds to purchase my ticket and that I must go top up my account.
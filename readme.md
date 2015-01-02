fundlr
========
An easy-to-use online budget app

Design Ideas
===
* In budget detail view, the line items can be customized
  - ie. Total Expenses, Biggest Spender, etc etc
* Tags can be added on the fly
* I need to make the transaction and budget details more similar
* The "banks" area is under the user menu
  - I'm thinking maybe banks can be visible to accounts, and different banks can be visible per user as well... maybe... not sure what the point of that would be though
* The month and the year are clickable - once clicked, you can select a different one
* As checkboxes on budgets are clicked, the transaction list filters

* ~~I need a way to show split transactions... this will make more sense once I have my head around entering a new transaction... start with the total FIRST and go from there~~

Now that I have revised the dashboard, I am coming to understand that transactions are independent of
banks and budgets... kind of. One transaction can have many bank associations and many budget assocations,
each of which are different. When you put in a transaction, you basically take your receipt and put in
the total. From there, you can divy up what was spent where.

~~The **credit cards** budget should be special... it should house all credit cards under one budget
that is automatically placed at the bottom of all of the other budgets and *can* be moved, but with
a warning. In the budget detail, it should list the credit cards, their balances, and their minimums.
You should be able to create a transaction for each card with one click.~~

~~As I'm writing this, I'm thinking that maybe all budgets should work in a similar way... maybe on the left
budget list bar, instead of an actual budget, maybe it should be a budget category. No... the automobile
category makes this idea fail. Gas is more important than groceries in some cases, but I could not imagine
that all auto expenses, including preventative maintenance could be the same.~~

I'm thinking of having fundlr **automatically** zero out the budget... so there shouldn't be a need
for a budget balance or any kind of "safe to spend" thing. If you want to increase a budget amount,
you need to decrease the funds from other budgets.

Due dates on bills need to be taken into account as well. If a due date is coming up or is here
and the bill budget doesn't have the funds, but budgets above it do, then it will recommend that you
take money out of the other budgets to pay the bill. However, it will not force this.

* Incomes and Expenses can be scheduled for the future and set to repeat

* Budgets can be a part of sinking funds as well - this is set up in the + Budgets screen

Design
===
![Design](./designs/design.png)

[Flat Shadows](http://flattyshadow.com)

![](http://designmodo.com/wp-content/themes/designmodov2.1/square-ui/images/big_previews/components_1.jpg)
![](http://designmodo.com/wp-content/themes/designmodov2.1/square-ui/images/big_previews/components_2.jpg)
![](http://designmodo.com/wp-content/themes/designmodov2.1/square-ui/images/big_previews/components_3.jpg)

Fonts
===
Montserrat Free
http://www.google.com/webfonts#UsePlace:use/Collection:Montserrat

Open Sans Free
http://www.google.com/webfonts#UsePlace:use/Collection:Open+Sans

Colors
===
http://flatuicolors.com
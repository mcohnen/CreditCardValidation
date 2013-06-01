#CreditCardValidation#

iOS example to validate Credit Cards.

##Notes##

- *MCForm:* To build the form, I used something similar to an opensourced project I did (https://github.com/mcohnen/MCForms). The idea behind it is that you can create a form based on UITableView, simply by creating instances of MCFormModel, that will have both the data to create the table cells, and will provide blocks to interact with touches, changes in textfields, etc... Another advantage is that changing the order of fields within MCForm won't affect any other part of the form, since the models contain the behavior logic too. 
For this project I did not link with that library, but instead I made a simpler version.

- *Localization*: The strings are not localized. It should be easy enough to move them to a l18n file but I guess this was not the purpose of the exercise.

- *Validation*: I added some basic "onKeyPressed" individual validators, but the class CreditCard would have all the validation details.

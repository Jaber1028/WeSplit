# WeSplit
## A Simple Check Splitting app
A simple tool to help calculate the cost of a check after a given tax. Can also be used to find cost per person, if the check
needs to be equally split per person.

Built with Swift & SwiftUI, inspired from #100DaysOfSwift by Hacking With Swift

## To use:
Input a Double value for the price on the top TextField. Hit "Done" on the toolbar and the keyboard will hid itself.
Then, choose the number of people and the amount of tip to apply.
Done! The results of both the total cost and the amount per person will be automatically calculated below.

### Tools used:
FocusedState/Toolbar: To hid the keyboard after the input is inserted (Button is used for "Done" functionality).
NavigationStack: to prevent scrolling on past IOS devices from going past safe area.
TextField: to input cost, format cost to user's local currency type.
Picker: to loop through all possible percentages for tax and give the ability to choose up to 99 people to split the check with.
Forms/Section: Neatly split each section with headers to give a easier look for users.



# credits to Paul Hudson's GREAT SwiftUI course! 

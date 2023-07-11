#Temperature

A small CLI app that allows the user to add patients to the fictional Health Machine Inc.'s system. Once added, a user can record temperature readings for a given patient and then call the patient's latest 3 records. All data is gone upon exiting the app.

This was built from the prompt and steps below:

Prompt:

Let's say you were asked to build a system for processing temperatures to detect whether someone was showing signs of infection. A fever is one of the signs of infection. The system in question has several thousand patients and their temperatures are taken every hour. Over the course of the day a person's temperature fluctuates as much as 1 degree in response to activity, and not everyone starts out at the same temperature. Some individuals are warmer than others, and it can vary as much as 1 degree from person to person. In addition, how you take a temperature impacts the result also by 1 degree. You can take it by ear, mouth, armpit, etc. You can also take temperatures in Celsius or Fahrenheit, and if you are serious about your temperatures, Kelvin.

Steps:

Step 1: Design a class that represents a temperature.
Step 2: Using the temperature class, show me how you would write code to detect whether someone has a fever or not.
Step 3: How would you approach testing the fever detector class or method?
Step 4: We have a stream of these coming into the system we want to be able to quickly group the data by patient as detect the fever but the feed never stops we don’t care about temperatures from a week ago, a day ago, and in some cases even ones from earlier in the day old data stops being useful to the algorithm pretty quickly what approach should we use so that we can always get the last X temperatures for a patient efficiently?

Running the app:

Ruby version 2.7.4 is required

1. Clone down the app
2. run `ruby runner.rb` in the terminal
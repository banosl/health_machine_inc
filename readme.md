# Health Machine Inc. - Patient Management CLI App

## Overview

Health Machine Inc. CLI app is a small Ruby application that allows users to manage patient records within the fictional Health Machine Inc.'s system. With this app, users can easily add new patients, record temperature readings for each patient, and retrieve the latest 3 temperature records. Additionally, the app provides a feature to determine if a patient had a fever in the latest 3 records. The app is designed to handle all data in-memory and clears the data upon exiting.

## Motivation

I created this CLI app to sharpen my Ruby programming skills and explore test-driven development practices. The healthcare theme was chosen due to the clear definition of attributes required for patient records, making it an ideal scenario to showcase the need for data management and frequent updates.

## Features

- Add new patients to the system.
- Record and manage temperature readings for each patient.
- Retrieve the latest 3 temperature records for a specific patient.
- Determine if a patient had a fever in the latest 3 records.

## Requirements

- Ruby version 2.7.4
- The 'rspec' gem for running tests.

## How to Use

1. Clone this repository to your local machine.
2. Navigate to the app's directory.
3. Execute the app by running the following command in your terminal:

  `ruby runner.rb`


Make sure you have Ruby version 2.7.4 installed on your system before running the app.

## Test-Driven Development

This app was developed following test-driven development (TDD) principles, which includes both unit and integration tests. The test suite ensures the app's reliability and correctness while allowing for easier maintenance and future updates.

## Future Updates

While the current version of the Health Machine Inc. CLI app provides basic patient temperature record functionality, I intend to continue developing the app with the following features:

1. **Unique Patient IDs:** Introduce an ID attribute for each patient, ensuring that every patient has a unique identifier. This enhancement will facilitate more precise patient lookups and provide a foundation for future features.

2. **Enhanced Patient Lookup:** Add a `find_patient_by_ID` method to `Clinic.rb` to enable more specific patient lookups using their unique ID. This improvement will make patient retrieval more efficient and reliable.

3. **Refined User Interface:** To improve code organization and maintainability, break down the `execute_options` method in `Interface.rb` into separate helper methods, one per option. This refactoring will enhance abstraction and readability of the codebase.

4. **Support for Additional Health Records:** In addition to temperature readings, I plan to extend the app to support other health metrics, such as weight, blood pressure, oxygen levels, and more. Users will have the flexibility to record various health data for each patient, making the app more versatile for healthcare management.
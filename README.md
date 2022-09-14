# coolblue-test-assignment
Project description

- The assignment has been finished in ~4 hours which included project setup, writing code + tests coverage.

- The assignment has been done using iOS 15.5, language version Swift 5.

- UI is optimized for iPhone portrait mode, iPad and device rotation is not supported.

- Text strings are hardcoded in English, multi-language is not supported.

- Used system fonts and colors, both light and dark modes are supported.

- Assignment is done using SwiftUI. For the architecture desing patter I decided to go with the MVVM which I think suits the best.

- Networking is done using Combine and DataTaskPublisher. It uses one generic execute function so it makes it very easy to add any new methods to the APIClient if needed.

- UI is very much simple and straightforward, just displaying the main image of the product with the title and the price. I decided to keep it simple to be able to finish the assignment in requested time and focus on other things if needed.

- Project contains Unit tests for the Networking part and a SearchViewModel. I didnt try to cover all the possible scenarious, just to show the basic approach. If needed more tests can be added, project has all the needed infrastructure and mocks.

- I added some basic UI tests to show the approach I'm following when writing UI tests.

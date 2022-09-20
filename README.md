# coolblue-test-assignment

Project description

- The assignment has been finished in ~4 hours which included project setup, writing code + tests coverage.

- The assignment has been done using iOS 15.5, language version Swift 5.

- UI is optimized for iPhone portrait mode, iPad and device rotation is not supported.

- Text strings are hardcoded in English, multi-language is not supported.

- Used system fonts and colors, both light and dark modes are supported.

- I didnt use any of the 3rd party solutions. I prefer to use iOS SDK as much as possible and not rely on any external pods / swift pachages. In my opinion it makes it easier to maintain. Also have a negative experience using 3rd parties in the core features which were not supported propely and it makes it harder to update and adjust to your needs.

- During the interview we discussed that your company is shifting towards SwiftUI approach so I decided to make the assignment using SwiftUI + Combine. For the architecture desing patter I decided to go with the MVVM approach which I think suits the best.

- Networking is done using Combine and DataTaskPublisher. It uses one generic execute function so it makes it very easy to add any new methods to the APIClient if needed.

- UI is simple and straightforward, just displaying the main image of the product with the title and the price. I decided to keep it simple to be able to finish the assignment in requested time and focus on other things if needed.

- Project contains Unit tests for the Networking part and a SearchViewModel. I didnt try to cover all the possible scenarious, just to show the basic approach. If needed more tests can be added, project has all the needed infrastructure and mocks.

- I added some basic UI tests to show the approach I'm following when writing UI tests.

- In the product you can find a ProductDetailsView which will be shown once you select any product from the List.

- Added last minute changes including pagination for the Search

What can be improved:

- Add caching for the images.   

- Do not store all search results in the array. It can be a problem with a big amount of data. Needs to be solved with some offload mechanism 

- Replace AsyncImage with a custom solution based on dataTaskPublisher to have a control over it and be able to cancel loading

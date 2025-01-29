# Swerkin

Swerkin is an instrumentation testing framework with 5 main objectives:

1. Extend existing open-source iOS instrumentation libraries.  

   For now, Swerkin extends [KIF - Keep it Functional](https://github.com/kif-framework/KIF) but in future releases could extend [XCUITest](https://developer.apple.com/documentation/xctest/user_interface_tests) and/or [Earl Grey](https://github.com/google/EarlGrey).

2. Tests built from the frameworks use Gherkin-like syntax (Given/When/Then). 

   This makes the setup of the test, the action the test is taking, and what the test is verifying easy to read and understand. 

   The Gherkin-like syntax makes it easier to build the test scenarios as a collaboration between developers and non-developers

3. Provide a catalog of predefined step definitions and a pattern to write new step definitions in Swift.

   The ability to create test scenarios should be easy for developers and non-developers but should provide a familiar experience for developers; which includes using auto-complete to find the steps, writing the test scenarios in Swift, and the ability to debug the steps within XCode.

4. Ability to test individual screens without having to navigate through entire application.

   This allows for targeted testing and reduces testing times for screens that may appear deep within the application.

5. Ability to test entire flows in an easy to read and succinct manner.

   Retaining the ability to test entire flows in addition to targeted testing gives you the best of both worlds.  Utilizing the Gherkin-like syntax for the flow tests, allows for better understanding of the test setup and its verification.

## How to Contribute

Please see the [Contributing file](https://github.com/Progressive-Insurance/Swerkin/blob/main/CONTRIBUTING.md) on how to contribute to this framework.

## License

Swerkin is available under the MIT license. See the [LICENSE file](https://github.com/Progressive-Insurance/Swerkin/blob/main/LICENSE.md) for more info.


# Swerkin Functionality

There are 3 major components of the Swerkin framework: Base Test Case, Step Definitions, and Screen Objects.

## BaseTestCase

The BaseTestCase is the foundation of every test class created from this framework.  It provides several features that can be utilized by the tests within each test class.

1. __Test Tags__: The ability to add specific tags to test classes and test functions to build dynamic test suites.

2. __TestInfo__: A dictionary to store test specific data needed for each test.

3. __Timeouts__: (configurable)
    - testTimeout: timeout for entire test before failing (default: 60 seconds)
    - waitingTimeout: timeout for waiting for a condition to be true (default: 2 seconds)
    - validationTimeout: timeout before failing validations (default: 2 seconds)

4. __Preconditions__: A dictionary to hold setup data that can be used to determine how a flow and/or end-to-end test is executed.

5. __CurrentScreen__: A presentable screen on which the test begins.

6. __ScreenPresenter__: A specific class that provides the ability to register all the screen objects under test and can return a specific screen when needed.

7. __Swerkin Objects__: including Given / When / Then / And, to provide the Gherkin-like experience and can be extended further if other Gherkin syntax is required.

## Step Definitions

Swerkin step definitions are divided into three types:
1. Setup
2. Action
3. Assertion

#### __SETUP__:

Setup step definitions are used for setting up and rendering the screen(s) under test.

```Swift
//Sets the current screen in the test case to a given presentable screen
func IAmOnScreen(screen: PresentableScreen)
```

```Swift
//Render a given presentable screen from the system under test
func IRender(screen: PresentableScreen) 
```

```Swift
//Navigate from one screen to another via a set of step definitions
func INavigate(fromScreen: PresentableScreen, 
               toScreen:PresentableScreen) 
```

#### __ACTION__:

Action step defintions are used to interact with the elements using their  accessibility attributes (ID, Label, Traits, etc.).

```Swift
//Touch button with given accessibility identifier
public func ITouchButton(_ buttonId: String) 
```

```Swift
//Touch button with given accessibility label
public func ITouchButton(withLabel buttonLabel: String)
```

```Swift
//Enter text into a text field with a given accessibility identifier
public func IEnterIntoTextField(_ id: String, text: String)
```

#### __ASSERTION__:

Assertion step defintions are used to verify elements using their  accessibility attributes (ID, Label, Traits, etc.).

```Swift
//Verifies a UIButton exists with the given accessibility identifier
public func IShouldSeeButton(_ buttonId: String)
```

```Swift
//Verifies a UIButton exists with the given accessibility label
public func IShouldSeeButton(withLabel buttonLabel: String)
```

```Swift
//Verifies a UITextField with a given accessibility identifier contains specific text  
public func IShouldSeeTextField(_ textFieldId: String, 
                                 withText text: String)
```

## Screens 

### __Screen Objects__

Each screen is _Viewable_, _Assertable_, _Touchable_, _Renderable_, and _Navigable_.  Each screen includes: 
1. A reference to the current test case
2. A unique trait that is used to identify the screen
3. The name of the screen
4. A method to render the screen
5. A list of entry points to aid in navigation to the screen during flow testing

### __PresentableScreen & ScreenProvider__

__PresentableScreen__ is a protocol to use when defining the enum of the presentable screens in the application.  

__PresentableScreen__ is an abstraction from the screen object to accomodate workspaces that are broken down into separate feature modules.  All presentable screens under test can be defined in a core module even if the screen objects are defined in separate feature modules within the workspace.

__ScreenProvider__ is a class that given a PresentableScreen can return either the Screen type or the Screen object.  If a workspace is broken into multiple feature modules, each module will define its own ScreenProvider for the screen objects defined within the module. 

### __ScreenPresenter__

__ScreenPresenter__ is a class that implements the registration of the ScreenProviders so all screens are available to the tests.  

The class also provides a method to return a specific Screen Provider Object given a Presentable Screen as well as a method to return a specific Screen object given a Presentable Screen.

### __ScreenRenderer__

__ScreenRenderer__ is a protocol for creating a screen from the system under test.  

# Installation

Swerkin is available through [CocoaPods](https://cocoapods.org).

To install it, simply add the following to your Podfile:

```
target 'Your Apps' do
  ...
end

target 'Acceptance Tests' do
  pod 'Swerkin'
end
```

After adding, Run pod install to complete 

# Implementation

There are three components that must be implemented
- Test Core Classes
- Screen Object Classes
- Test Classes (aka Features or Specs)

### Test Core Classes

__Screen Class__

We recommend creating a base screen class that implements the Screen protocol so default values can be provided.

```Swift
class ExampleBaseScreen: Screen {
    final var test: BaseTestCase
    
    final let renderer: ScreenRenderer = ExampleScreenRenderer()

    public required init(testCase: BaseTestCase) {
        self.test = testCase
    }

    final var testName: String { return test.name }

    var trait: String { return "" }
    var name: String { return "" }
    func create() -> UIViewController { UIViewController() }
    func renderScreen() {}
    func entryPathSegments() -> [PathSegment] {
        return []
    }
}
```

The other option is each Screen object should implement the Screen protocol.

__PresentableScreen Enum__

Create an enum with a case for each screen to be tested within the application.

```Swift
public enum ExamplePresentableScreen: String, PresentableScreen {
    case buttonScreen
    case dropDownScreen
    case endToEndScreen
    case homeScreen
    case swipeScreen
    case tappableScreen
    case textFieldScreen
    case waitToSeeScreen
    case tableViewScreen
    
    public var rawValue: String {
        get {
            return String(describing: self).capitalized
        }
    }
}
```

__ScreenProvider Class__

Each ScreenProvider class should inherit from ScreenProvider<T> and override the functions screen and typeMarker for the Presentable Screens being translated to their respective Screens.

```Swift
public class ExampleScreenProvider: ScreenProvider<ExamplePresentableScreen> {
    public var testReference: BaseTestCase! = nil

    public required init(testCase: BaseTestCase?) {
        self.testReference = testCase
    }
    
    public override func screen(for screen: ExamplePresentableScreen) -> Screen? {
        switch screen {
        case .buttonScreen:
            return ButtonScreen(testCase: self.testReference)
        case .dropDownScreen:
           return DropdownScreen(testCase: testReference)

        ...
            
        }
    }

    public override func typeMarker(for screen: ExamplePresentableScreen) -> Screen.Type? {
        switch screen {
        case .buttonScreen:
            return ButtonScreen.self
        case .dropDownScreen:
            return DropdownScreen.self

        ...

        }
    }
}
```

__Screen Renderer Class__

The ScreenRenderer class should implement the ScreenRender protocol and provide a implementation for the function screen.  The function should three key elements:
1. Create the screen under test (most likely a ViewController)
2. Add the screen under test to the top of the Navigation stack
3. Verify a unique element on the screen (trait) appears as expected

```Swift
class ExampleScreenRenderer: ScreenRenderer {
    func screen(_ screenObject: Screen, didRenderWithAuth isAuth: Bool) {
       guard let screenObject = screenObject as? ExampleBaseScreen else { return }
        
        if isAuth {
            //Add code that is special to your app when the user is authenticated
        }
        
        //Navigation code to render the ViewController and add it to the stack to navigate directly to it
        if let navigationController = UIApplication.shared.topNavigationController() {
            navigationController.pushViewController(screenObject.create(), animated: false)
        }
        screenObject.viewTester.waitForAnimationsToFinish()
        screenObject.waitForElement(withIdentifier: screenObject.trait)
    }
}
```
__Test Case Class__

Create an Test Case class for your tests that inherits from BaseTestCase.  Register all the ScreenProviders in the setup and make sure to reset the test environment in the tearDown so each test can run independently.

When creating the Test Case class the defaults from BaseTestCase can also be overridden. 

```Swift
open class ExampleTestCase: BaseTestCase {

    open override func setUp() {
        super.setUp()

        self.screenPresenter.registerScreenProvider(ExampleScreenProvider(testCase: self), for: ExamplePresentableScreen.self)
    }

    open override func tearDown() {
        resetNavigation {
            self.navigateHome()
            self.waitForAnimationsToFinish()
        }

        super.tearDown()
    }
    ...
}
```

### Screen Object Classes
Create screen object classes that inherits from either your base screen object or implements the Screen protocol.  There should be a screen object class for each screen being verified within the system under test.

Each screen object should implement the following:

- var trait
- var name
- func create()
- func entryPathSegments()
- func renderScreen()
- enum View: Accessibility

### Test Classes (aka Features / Specs)
Create test classes that inherit from your application's base test case class.  Within the test class, build the test cases using the catalog of step definitions using the Gherkin-like syntax.

```Swift
class Dropdown: ExampleTestCase {
    private let textField = DropdownScreen.View.textField.accessibilityIdentifier
    
    func testVerifySingleItem() {
        Given.IAmOnScreen(ExamplePresentableScreen.dropDownScreen)
        And.IRender(screen: ExamplePresentableScreen.dropDownScreen)
        When.ISetDropDown(textField, toValue: "Banana")
        Then.IShouldSeeTextField(textField, withText: "Banana")
    }

    func testVerifyWithLabelItem() {
        Given.IAmOnScreen(ExamplePresentableScreen.dropDownScreen)
        And.IRender(screen: ExamplePresentableScreen.dropDownScreen)
        When.ISetDropDown(withLabel: "textField", toValue: "Orange")
        Then.IShouldSeeTextField(textField, withText: "Orange")
    }

    ...
}
```

--------------------------------------------------------------------
## Example Application

An example application was created as a vehicle to illustrate how to implement the framework. As discussed above in the implementation sections, there are three components that were implemented to write Swerkin tests against the example application:
- Test Core Classes
- Screen Object Classes
- Test Cases

### Test Core Classes
Example test core classes have been added under Swerkin-UITests-Examples/TestCore including:
- ExampleBaseScreen
- ExamplePresentableScreen
- ExampleScreenRenderer 
- ExampleScreenProviders
- ExampleTestCase 

### Screen Object Classes
Examples of screen objects for each ViewController in the example application have been added under Swerkin-UITests-Examples/Screens. 

### Test Cases

Example test cases for most of the UI elements have been added under Swerkin-UITests-Examples/Features.

Here is an example test for the verification of the text within the first name text field using its accessibility label.

```Swift
func testVerifyExistenceOfFirstNameTextFieldWithLabel() {
   Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
   And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
   When.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
   Then.IShouldSeeTextField(withLabel: "first name text Field", 
                            withText: "John")
}
```

### How to Run Example App & UI Tests
To run the example project, clone the repo, and run `pod install` from the Example directory first.

Select CMD-U Swerkin_Example scheme to execute the tests.


import Swerkin

public class ExampleScreenProvider: ScreenProvider<ExamplePresentableScreen> {
    public var testReference: BaseTestCase! = nil

    public required init(testCase: BaseTestCase?) {
        self.testReference = testCase
    }
    
    public override func screen(for screen: ExamplePresentableScreen) -> Screen? {
        switch screen {
        case .buttonScreen:
            return ButtonScreen(testCase: self.testReference)
        case .textFieldScreen:
            return TextFieldScreen(testCase: testReference)
        }
    }

    public override func typeMarker(for screen: ExamplePresentableScreen) -> Screen.Type? {
        switch screen {
        case .buttonScreen:
            return ButtonScreen.self
        case .textFieldScreen:
            return TextFieldScreen.self
        }
    }
}

open class ExampleTestCase: BaseTestCase {

    open override class var validationTimeout: TimeInterval { get { return 10.0 }}
    open override var waitingTimeout: TimeInterval { get { return 10.0 }}

    var mainStore: RxStore<AppState> = resolve()
    let nav: NavigatorImpl? = resolve()
    let defaultsHandler: DefaultsHandlerProtocol = resolve()

    open override func setUp() {
        super.setUp()
        UserDefaults.standard.set(true, forKey: "kSnapshotTutorialCompleted")
        UserDefaults.standard.set(false, forKey: "DriverSurveyIsUnrecorded")
        defaultsHandler.isAccidentDetectionOnboardingCompleted = true

        setupMainStore()
        apply(assembly: MockAssembly())
        resetFeatureSwitches()
        CrashDetectionTransitions.shared = CrashDetectionTransitions()

        self.screenPresenter.registerScreenProvider(TelematicsScreenProvider(testCase: self), for: TelematicsPresentableScreen.self)
    }

    open override func tearDown() {
        mainStore.dispatchOnQueue(ClearAppStateAction())

        if let userInfoService: UserInfoService = resolve(),
           userInfoService.isAuthenticated {
            And.ILogoutOfSnapshot()
        }

        resetUserDefaults()

        resetNavigation {
            self.nav?.reset()
            self.waitForAnimationsToFinish()
        }

        super.tearDown()
    }

    open override class func setUp() {
        super.setUp()
    }

    open override class func tearDown() {
        super.tearDown()
    }

    func setupMainStore() {
        self.mainStore = RxStore<AppState>(
            reducer: handleAction,
            state: nil,
            middleware: !UserDefaults.standard.bool(forKey: "TESTING") ? [ConsoleLoggingMiddleware] : []
        )
        DependencyContainerProvider.sharedProvider.apply(assembly: ApplicationAssembly(store: mainStore))
    }

    private func resetNavigation(navigate: @escaping () -> Void) {
        if let alert = UIApplication.shared.topNavigationController()?.presentedViewController {
            alert.dismiss(animated: false) { navigate() }
        } else {
            navigate()
        }
    }

    private func resetUserDefaults() {
        UserDefaults.standard.removeObject(forKey: "DriverSurveyIsUnrecorded")
        UserDefaults.standard.removeObject(forKey: "kSnapshotTutorialCompleted")
        UserDefaults.standard.removeObject(forKey: "kSnapshotLastTripTutorialCompleted")
        UserDefaults.standard.removeObject(forKey: "kHasShownTripDetailTransitEditorTip")
        UserDefaults.standard.removeObject(forKey: "khasPromptedRideshareKey")
        UserDefaults.standard.removeObject(forKey: "kTripListFilterDriverOnlyPreference")
        UserDefaults.standard.removeObject(forKey: "kSnapshotAccidentDetectedTutorialCompleted")
        UserDefaults.standard.removeObject(forKey: "needsToShowStayConnectedOverlayKey")
        UserDefaults.standard.removeObject(forKey: "kIsOnboardingCompleted")
        UserDefaults.standard.removeObject(forKey: "isCrashAssistTurnedOn")
        UserDefaults.standard.removeObject(forKey: ConfigurationKey.MockScenarioValue)
        UserDefaults.standard.removeObject(forKey: "kCensioTrackingHasSunsetDevice")
    }

    private func resetFeatureSwitches() {
        UserDefaults.standard.set(true, forKey: "mockFeatureSwitcherEnabled")
        let featureCache: FeatureOptimizationCacheProtocol? = resolve()
        featureCache?.clearCache()
    }
}

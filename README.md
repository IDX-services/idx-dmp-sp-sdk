# IdxDmpSdk

## App configuration

Add new key and value to `Info.plist` file

```xml
<key>NSUserTrackingUsageDescription</key>
<string>It makes our adwords more compatibility with your interests</string>
```

## Integration DataManagerProvider example

```swift
class ViewController: UIViewController {
    var dmp: DataManagerProvider?
    
    ...

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dmp = DataManagerProvider(providerId: providerId, appName: "My app name", appVersion: "1.0.0") {_ in
          // Success callback
        }
    }

    ...
    
    @IBAction func handleShowAd() {
        guard let dmp = self.dmp else {
            return
        }

        let adRequest: GAMRequest = GAMRequest()
        adRequest.customTargeting = dmp.getCustomAdTargeting()
    }

    ...
}
```

## Integration DMPWebViewConnector example

```swift
class ViewController: UIViewController {
    var dmpWebViewConnector: DMPWebViewConnector?
    
    ...

    override func viewDidLoad() {
        super.viewDidLoad()
        // You have to set your WKWebView instance
        connector = DMPWebViewConnector(yourWebView.configuration.userContentController, "My app name", "1.0.0")
    }

    ...
    
    @IBAction func handleShowAd() {
        guard let connector = self.connector else {
            return
        }

        let adRequest: GAMRequest = GAMRequest()
        adRequest.customTargeting = connector.getCustomAdTargeting()
    }

    ...
}
```

## Author

IDX LTD, https://www.id-x.co.il/

## License

IdxDmpSdk is available under the MIT license. See the LICENSE file for more info.

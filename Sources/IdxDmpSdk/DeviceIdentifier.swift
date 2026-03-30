import Foundation
import UIKit
import AdSupport
import AppTrackingTransparency

public struct DeviceIdentifier {

    /// Requests ATT permission (iOS 14+)
    public static func requestTrackingIfNeeded() {
        if #available(iOS 14.0, *) {
            ATTrackingManager.requestTrackingAuthorization { _ in }
        }
    }

    public static func getDeviceId() -> String {
        if #available(iOS 14.0, *) {
            if ATTrackingManager.trackingAuthorizationStatus == .authorized {
                return ASIdentifierManager.shared().advertisingIdentifier.uuidString
            }
        } else {
            let identifierManager = ASIdentifierManager.shared()
            if identifierManager.isAdvertisingTrackingEnabled {
                return identifierManager.advertisingIdentifier.uuidString
            }
        }
        return UIDevice.current.identifierForVendor?.uuidString ?? "UNKNOWN_DEVICE_ID"
    }
}

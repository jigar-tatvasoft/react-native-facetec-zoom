import UIKit
import Foundation
import FaceTecSDK

class ZoomGlobalState {
    // "https://api.zoomauth.com/api/v3/biometrics" for FaceTec Managed Testing API.
    // "http://localhost:8080" if running ZoOm Server SDK (Dockerized) locally.
    // Otherwise, your webservice URL.
    static let ZoomServerBaseURL = "https://facetec.veriid.com/v9"
    
    static let Authorization = "Basic UEItRUFQMDAxOmQ5NmNhMmExZTRkNmYwZWVjMTdkYmQ5MGQyMWM1ZGJi"

    // this app can modify the customization to demonstrate different look/feel preferences for ZoOm
    static var currentCustomization: FaceTecCustomization = FaceTecCustomization()
}

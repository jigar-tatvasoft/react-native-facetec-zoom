//
//  ZoomAuth.swift
//  ZoomSdkExample
//
//  Created by Willian Angelo on 25/01/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

import UIKit
import FaceTecSDK
import Network

@objc(ZoomAuth)
class ZoomAuth:  RCTViewManager, ProcessingDelegate, URLSessionTaskDelegate {

  var resolver: RCTPromiseResolveBlock? = nil
  var rejecter: RCTPromiseRejectBlock? = nil
  var returnBase64: Bool = false
  var initialized = false
  var licenseKey: String!

  func getRCTBridge() -> RCTBridge
  {
    let root = UIApplication.shared.keyWindow!.rootViewController!.view as! RCTRootView;
    return root.bridge;
  }

  // React Method
  @objc func verifyLiveness(_ options: Dictionary<String, Any>, // options not used at the moment
                      resolver resolve: @escaping RCTPromiseResolveBlock,
                      rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    self.resolver = resolve
    self.rejecter = reject
    self.returnBase64 = options["returnBase64"] as? Bool ?? false;
    DispatchQueue.main.async {
      let root = UIApplication.shared.keyWindow!.rootViewController!
      var optionsWithKey = options
      optionsWithKey["licenseKey"] = self.licenseKey
      self.getSessionToken() { sessionToken in
        let _ = LivenessCheckProcessor(sessionToken: sessionToken, delegate: self, fromVC: root, options: optionsWithKey)
      }
    }
  }

  // React Method
  @objc func enroll(_ options: Dictionary<String, Any>, // options not used at the moment
                      resolver resolve: @escaping RCTPromiseResolveBlock,
                      rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    self.resolver = resolve
    self.rejecter = reject
    DispatchQueue.main.async {
      let root = UIApplication.shared.keyWindow!.rootViewController!
      var optionsWithKey = options
      optionsWithKey["licenseKey"] = self.licenseKey
      self.getSessionToken() { sessionToken in
        let _ = EnrollmentProcessor(sessionToken: sessionToken, delegate: self, fromVC: root, options: optionsWithKey)
      }
    }
  }

  // React Method
  @objc func authenticate(_ options: Dictionary<String, Any>, // options not used at the moment
                      resolver resolve: @escaping RCTPromiseResolveBlock,
                      rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    self.resolver = resolve
    self.rejecter = reject
    DispatchQueue.main.async {
      let root = UIApplication.shared.keyWindow!.rootViewController!
      var optionsWithKey = options
      optionsWithKey["licenseKey"] = self.licenseKey
      self.getSessionToken() { sessionToken in
        let _ = AuthenticateProcessor(sessionToken: sessionToken, delegate: self, fromVC: root, options: optionsWithKey)
      }
    }
  }
  
  // React Method
  @objc func photoIDVerify(_ options: Dictionary<String, Any>, // options not used at the moment
                      resolver resolve: @escaping RCTPromiseResolveBlock,
                      rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    self.resolver = resolve
    self.rejecter = reject
    DispatchQueue.main.async {
      let root = UIApplication.shared.keyWindow!.rootViewController!
      var optionsWithKey = options
      optionsWithKey["licenseKey"] = self.licenseKey
      self.getSessionToken() { sessionToken in
        let _ = PhotoIDScanProcessor(sessionToken: sessionToken, delegate: self, fromViewController: root, options: optionsWithKey)
      }
    }
  }
  
  // Show the final result and transition back into the main interface.
    func onProcessingComplete(isSuccess: Bool, facetecSessionResult: FaceTecSessionResult?) {
      let statusCode = facetecSessionResult?.status.rawValue ?? -1
      var resultJson:[String:Any] = [
        "success": isSuccess,
        "status": statusCode
      ]

      if (!isSuccess) {
        self.sendResult(resultJson)
        return
      }
      var imagePaths = [String]()
      resultJson["sessionId"] = facetecSessionResult?.sessionId ?? ""
      
      if let lowQualityBase64 = facetecSessionResult?.auditTrailCompressedBase64{
        var index = 0;
        for item in lowQualityBase64{
          let imageName = "\(index).png"
          let path = self.saveImageToDiretory(item, name: imageName)
          imagePaths.append(path);
          index = index+1
        }
      }
      resultJson["auditTrailCompressedBase64"] = imagePaths

      if self.returnBase64 && facetecSessionResult?.faceScan != nil {
        resultJson["faceScanBase64"] = facetecSessionResult!.faceScanBase64
      }

      self.sendResult(resultJson)
    }
  
  // Show the final result and transition back into the main interface.
    func onProcessingComplete(isSuccess: Bool, facetecSessionResult: FaceTecSessionResult?, externalDatabaseRefID: String?, xUserAgent: String?) {
      let statusCode = facetecSessionResult?.status.rawValue ?? -1
      var resultJson:[String:Any] = [
        "success": isSuccess,
        "status": statusCode
      ]

      if (!isSuccess) {
        self.sendResult(resultJson)
        return
      }
      var imagePaths = [String]()
      resultJson["sessionId"] = facetecSessionResult?.sessionId ?? ""
      
      if let lowQualityBase64 = facetecSessionResult?.auditTrailCompressedBase64{
        var index = 0;
        for item in lowQualityBase64{
          let imageName = "\(index).png"
          let path = self.saveImageToDiretory(item, name: imageName)
          imagePaths.append(path);
          index = index+1
        }
      }
      resultJson["auditTrailCompressedBase64"] = imagePaths
      resultJson["externalDatabaseRefID"] = externalDatabaseRefID
      resultJson["xUserAgent"] = xUserAgent

      if self.returnBase64 && facetecSessionResult?.faceScan != nil {
        resultJson["faceScanBase64"] = facetecSessionResult!.faceScanBase64
      }

      self.sendResult(resultJson)
    }
    
    func saveImageToDiretory(_ base64: String, name:String) -> String {
      let decodedData = NSData(base64Encoded: base64, options: [])
      if let data = decodedData {
          let decodedimage = UIImage(data: data as Data)
          // Obtaining the Location of the Documents Directory
          let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

          // Create URL
          let url = documents.appendingPathComponent(name)

          // Convert to Data
          if let data = decodedimage?.pngData() {
              do {
                  try data.write(to: url)
                  return url.absoluteString
              } catch {
                return ""
                  print("Unable to Write Image Data to Disk")
              }
          } else {
            return ""
          }
        } else {
            print("error with decodedData")
          return ""
        }
    }

  
  // Show the final result and transition back into the main interface.
  func onProcessingComplete(isSuccess: Bool, facetecSessionResult: FaceTecSessionResult?, facetecIDScanResult: FaceTecIDScanResult?) {
      let statusCodeFaceTec = facetecSessionResult?.status.rawValue ?? -1
      let statusCodeFaceTecID = facetecIDScanResult?.status.rawValue ?? -1
      let statusCode = (statusCodeFaceTec != 0) && (statusCodeFaceTecID != 0)
//      var imageIds = [[String]]()
      var resultJson:[String:Any] = [
        "success": isSuccess,
        "status": statusCode
      ]
//      imageIds.append(facetecIDScanResult?.frontImagesCompressedBase64 ?? [])
//      imageIds.append(facetecIDScanResult?.backImagesCompressedBase64 ?? [])

      if (!isSuccess) {
        self.sendResult(resultJson)
        return
      }

//      resultJson["sessionId"] = facetecIDScanResult?.sessionId ?? ""
//      resultJson["imageIds"] = imageIds
//      resultJson["auditTrailCompressedBase64"] = facetecSessionResult?.auditTrailCompressedBase64 ?? []
    
    var imagePaths = [String]()
    
    resultJson["sessionId"] = facetecSessionResult?.sessionId ?? ""
    
    if let lowQualityBase64 = facetecSessionResult?.auditTrailCompressedBase64{
      var index = 0;
      for item in lowQualityBase64{
        let imageName = "\(index).png"
        let path = self.saveImageToDiretory(item, name: imageName)
        imagePaths.append(path);
        index = index+1
      }
    }
    resultJson["auditTrailCompressedBase64"] = imagePaths
    
    var frontIdPath = [String]()
    if let frontIdBase64 = facetecIDScanResult?.frontImagesCompressedBase64{
      var index = 10;
      for item in frontIdBase64{
        let imageName = "\(index).png"
        let path = self.saveImageToDiretory(item, name: imageName)
        frontIdPath.append(path);
        index = index+1
      }
    }
    
    resultJson["auditTrailPhotoFrontId"] = frontIdPath
  
    var backIdPath = [String]()
    if let backIdBase64 = facetecIDScanResult?.backImagesCompressedBase64{
      var index = 100;
      for item in backIdBase64{
        let imageName = "\(index).png"
        let path = self.saveImageToDiretory(item, name: imageName)
        backIdPath.append(path);
        index = index+1
      }
    }
    
    resultJson["auditTrailPhotoBackId"] = backIdPath

      if  facetecIDScanResult?.idScan != nil {
        resultJson["faceScanBase64"] = facetecIDScanResult!.idScan
      }
      self.sendResult(resultJson)
    }
  
  func sendResult(_ result: [String:Any]) -> Void {
    if (self.resolver == nil) {
      return
    }

    self.resolver!(result)
    self.cleanUp()
  }

  // not used at the moment
  func sendError(_ code: String, message: String, error: Error) -> Void {
    if (self.rejecter == nil) {
      return
    }

    self.rejecter!(code, message, error)
    self.cleanUp()
  }

  func cleanUp () -> Void {
    self.resolver = nil
    self.rejecter = nil
  }

  func uiImageToBase64 (_ image: UIImage) -> String {
    let imageData = image.jpegData(compressionQuality: 0.9)! as NSData;
    return imageData.base64EncodedString(options: [])
  }

  func uiImageToImageStoreKey (_ image: UIImage, completionHandler: @escaping (String?) -> Void) -> Void {
    let bridge = getRCTBridge()
    let imageStore: RCTImageStoreManager = bridge.imageStoreManager;
    imageStore.store(image, with: completionHandler)
  }

  func storeDataInImageStore (_ data: Data, completionHandler: @escaping (String?) -> Void) -> Void {
    let bridge = getRCTBridge()
    let imageStore: RCTImageStoreManager = bridge.imageStoreManager;
    imageStore.storeImageData(data, with: completionHandler)
  }

  // React Method
  @objc func getVersion(_ resolve: RCTPromiseResolveBlock,
                        rejecter reject: RCTPromiseRejectBlock) -> Void {

      let result: String = FaceTec.sdk.version

      if ( !result.isEmpty ) {
          resolve([
              result: result
          ])
      } else {
          let errorMsg = "SDK Errror"
          let err: NSError = NSError(domain: errorMsg, code: 0, userInfo: nil)
          reject("getVersion", errorMsg, err)
      }
  }

  // React Method
  @objc func initialize(_ options: Dictionary<String, Any>,
                        resolver resolve: @escaping RCTPromiseResolveBlock,
                        rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    self.licenseKey = options["licenseKey"] as! String

    let faceMapEncryptionKey = options["facemapEncryptionKey"] as! String

    FaceTec.sdk.auditTrailType = .height640 // otherwise no auditTrail images

//    // Create the customization object
//    let currentCustomization: FaceTecCustomization = FaceTecCustomization()
//    // disable the "Your App Logo" section
//    currentCustomization.overlayCustomization.brandingImage = nil

    // Apply the customization changes
    //FaceTec.sdk.setCustomization(currentCustomization)
    ThemeHelpers.setAppTheme(theme: "custom_theme")
    FaceTec.sdk.initializeInDevelopmentMode(
      deviceKeyIdentifier: licenseKey,
      faceScanEncryptionKey: faceMapEncryptionKey,
      completion: { (licenseKeyValidated: Bool) -> Void in
        //
        // We want to ensure that licenseKey is valid before enabling verification
        //
        if licenseKeyValidated {
          self.initialized = true
          let message = "licenseKey validated successfully"
          print(message)
          resolve([
            "success": true
          ])
        }
        else {
          let status = FaceTec.sdk.getStatus().rawValue
          resolve([
            "success": false,
            "status": status
          ])
        }
      }
    )
  }

  func getSessionToken(sessionTokenCallback: @escaping (String) -> ()) {
      let endpoint = ZoomGlobalState.ZoomServerBaseURL + "/session-token"
      let request = NSMutableURLRequest(url: NSURL(string: endpoint)! as URL)
      request.httpMethod = "GET"
      // Required parameters to interact with the FaceTec Managed Testing API.
      request.addValue(self.licenseKey, forHTTPHeaderField: "X-Device-Key")
      request.addValue(FaceTec.sdk.createFaceTecAPIUserAgentString(""), forHTTPHeaderField: "User-Agent")
      
      let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.main)
      let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
          // Ensure the data object is not nil otherwise callback with empty dictionary.
          guard let data = data else {
              print("Exception raised while attempting HTTPS call.")
//              self.handleErrorGettingServerSessionToken()
              return
          }
          if let responseJSONObj = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject] {
              if((responseJSONObj["sessionToken"] as? String) != nil)
              {
//                  self.hideSessionTokenConnectionText()
                  sessionTokenCallback(responseJSONObj["sessionToken"] as! String)
                  return
              }
              else {
                  print("Exception raised while attempting HTTPS call.")
//                  self.handleErrorGettingServerSessionToken()
              }
          }
      })
      task.resume()
  }
}

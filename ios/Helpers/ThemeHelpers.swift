//
//  ThemeHelpers.swift
//  ZoomAuthentication-Sample-App
//
//  Created by Tyler Kistler on 12/16/19.
//  Copyright © 2019 FaceTec, Inc. All rights reserved.
//

import Foundation
import UIKit
import FaceTecSDK

class ThemeHelpers {

    public class func setAppTheme(theme: String) {
        if theme == "ZoOm Theme" {
            ZoomGlobalState.currentCustomization = FaceTecCustomization()
        }
        else if theme == "custom_theme"{
            // For Color Customization
            let outerBackgroundColor = UIColor(hexString: "#ffffff")
            let frameColor = UIColor(hexString: "#ffffff")
            let borderColor = UIColor(hexString: "#000000")
            let ovalColor = UIColor(hexString: "#f8a61b")
            let dualSpinnerColor = UIColor(hexString: "#f8a61b")
            let textColor = UIColor(hexString: "#919191")
            let buttonAndFeedbackBarColor =  UIColor(hexString: "#3c8f7c")
            let buttonAndFeedbackBarTextColor = UIColor(hexString: "#ffffff")
            let buttonColorPressed = UIColor(hexString: "#3c8f7c")
            let feedbackBackgroundLayer = CAGradientLayer.init()
            feedbackBackgroundLayer.colors = [buttonAndFeedbackBarColor.cgColor, buttonAndFeedbackBarColor.cgColor]
            feedbackBackgroundLayer.locations = [0,1]
            feedbackBackgroundLayer.startPoint = CGPoint.init(x: 0, y: 0)
            feedbackBackgroundLayer.endPoint = CGPoint.init(x: 1, y: 0)
            
            // For Frame Corner Radius Customization
            let frameCornerRadius: Int32 = 20

            let cancelImage = UIImage(named: "FaceTec_cancel")
            let cancelButtonLocation: FaceTecCancelButtonLocation = .disabled

            // For image Customization
            let yourAppLogoImage = UIImage(named: "FaceTec_your_app_logo")
            let securityWatermarkImage: FaceTecSecurityWatermarkImage = .faceTecZoom
            
            // Set a default customizatiom
            ZoomGlobalState.currentCustomization.ocrConfirmationCustomization.mainHeaderTextColor = buttonColorPressed
            ZoomGlobalState.currentCustomization.ocrConfirmationCustomization.mainHeaderDividerLineColor = buttonColorPressed
            ZoomGlobalState.currentCustomization.ocrConfirmationCustomization.buttonBackgroundNormalColor = buttonColorPressed
            ZoomGlobalState.currentCustomization.ocrConfirmationCustomization.buttonBackgroundHighlightColor = buttonColorPressed
            ZoomGlobalState.currentCustomization.ocrConfirmationCustomization.buttonBackgroundDisabledColor = buttonColorPressed
            // Set Frame Customization
            ZoomGlobalState.currentCustomization.frameCustomization.cornerRadius = frameCornerRadius
            ZoomGlobalState.currentCustomization.frameCustomization.backgroundColor = frameColor
            ZoomGlobalState.currentCustomization.frameCustomization.borderColor = borderColor

            // Set Overlay Customization
            ZoomGlobalState.currentCustomization.overlayCustomization.brandingImage = yourAppLogoImage
            ZoomGlobalState.currentCustomization.overlayCustomization.backgroundColor = outerBackgroundColor

            // Set Guidance Customization
            ZoomGlobalState.currentCustomization.guidanceCustomization.backgroundColors = [frameColor, frameColor]
            ZoomGlobalState.currentCustomization.guidanceCustomization.foregroundColor = textColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBackgroundNormalColor = buttonAndFeedbackBarColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBackgroundDisabledColor = buttonColorPressed
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBackgroundHighlightColor = buttonColorPressed
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonTextNormalColor = buttonAndFeedbackBarTextColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonTextDisabledColor = buttonAndFeedbackBarTextColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonTextHighlightColor = buttonAndFeedbackBarTextColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.retryScreenImageBorderColor = borderColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.retryScreenOvalStrokeColor = borderColor

            // Set Oval Customization
            ZoomGlobalState.currentCustomization.ovalCustomization.strokeColor = ovalColor
            ZoomGlobalState.currentCustomization.ovalCustomization.progressColor1 = dualSpinnerColor
            ZoomGlobalState.currentCustomization.ovalCustomization.progressColor2 = dualSpinnerColor

            // Set Feedback Customization
            ZoomGlobalState.currentCustomization.feedbackCustomization.backgroundColor = feedbackBackgroundLayer
            ZoomGlobalState.currentCustomization.feedbackCustomization.textColor = buttonAndFeedbackBarTextColor

            // Set Cancel Customization
            ZoomGlobalState.currentCustomization.cancelButtonCustomization.customImage = cancelImage
            ZoomGlobalState.currentCustomization.cancelButtonCustomization.location = cancelButtonLocation

            // Set Result Screen Customization
            ZoomGlobalState.currentCustomization.resultScreenCustomization.backgroundColors = [frameColor, frameColor]
            ZoomGlobalState.currentCustomization.resultScreenCustomization.foregroundColor = textColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.activityIndicatorColor = buttonAndFeedbackBarColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.resultAnimationBackgroundColor = buttonAndFeedbackBarColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.resultAnimationForegroundColor = buttonAndFeedbackBarTextColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.uploadProgressFillColor = buttonAndFeedbackBarColor
            
            // Set Security Watermark Customization
            ZoomGlobalState.currentCustomization.securityWatermarkImage = securityWatermarkImage

            // Set ID Scan Customization
            ZoomGlobalState.currentCustomization.idScanCustomization.selectionScreenBackgroundColors = [frameColor, frameColor]
            ZoomGlobalState.currentCustomization.idScanCustomization.selectionScreenForegroundColor = textColor
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenBackgroundColors = [frameColor, frameColor]
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenForegroundColor = buttonAndFeedbackBarTextColor
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenTextBackgroundColor = buttonAndFeedbackBarColor
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenForegroundColor = buttonAndFeedbackBarTextColor
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenTextBackgroundColor = buttonAndFeedbackBarColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBackgroundNormalColor = buttonAndFeedbackBarColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBackgroundDisabledColor = buttonColorPressed
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBackgroundHighlightColor = buttonColorPressed
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonTextNormalColor = buttonAndFeedbackBarTextColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonTextDisabledColor = buttonAndFeedbackBarTextColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonTextHighlightColor = buttonAndFeedbackBarTextColor
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenBackgroundColor = frameColor
            ZoomGlobalState.currentCustomization.idScanCustomization.captureFrameStrokeColor = borderColor
        }
        else if theme == "Well-Rounded" {
            let primaryColor = UIColor(red: 0.035, green: 0.710, blue: 0.639, alpha: 1) // green
            let backgroundColor = UIColor.white
            let backgroundLayer = CAGradientLayer.init()
            backgroundLayer.colors = [primaryColor.cgColor, primaryColor.cgColor]
            backgroundLayer.locations = [0,1]
            backgroundLayer.startPoint = CGPoint.init(x: 0, y: 0)
            backgroundLayer.endPoint = CGPoint.init(x: 1, y: 0)
            
            // Overlay Customization
//            ZoomGlobalState.currentCustomization.overlayCustomization.blurEffectStyle = .styleLight
//            ZoomGlobalState.currentCustomization.overlayCustomization.blurEffectOpacity = 0.8
            ZoomGlobalState.currentCustomization.overlayCustomization.backgroundColor = UIColor.clear
            ZoomGlobalState.currentCustomization.overlayCustomization.brandingImage = UIImage.init()
            // Guidance Customization
            ZoomGlobalState.currentCustomization.guidanceCustomization.backgroundColors = [backgroundColor, backgroundColor]
            ZoomGlobalState.currentCustomization.guidanceCustomization.foregroundColor = primaryColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonTextNormalColor = backgroundColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBackgroundNormalColor = primaryColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonTextHighlightColor = backgroundColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBackgroundHighlightColor = primaryColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBorderColor = UIColor.clear
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBorderWidth = 0
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonCornerRadius = 30
            ZoomGlobalState.currentCustomization.guidanceCustomization.readyScreenOvalFillColor = primaryColor.withAlphaComponent(0.2)
            // Guidance Image Customization
//            ZoomGlobalState.currentCustomization.guidanceCustomization.imageCustomization.cameraPermissionsScreenImage = UIImage(named: "camera_green")
            // ID Scan Customization
            ZoomGlobalState.currentCustomization.idScanCustomization.selectionScreenBrandingImage = UIImage.init()
            ZoomGlobalState.currentCustomization.idScanCustomization.showSelectionScreenBrandingImage = false
            ZoomGlobalState.currentCustomization.idScanCustomization.selectionScreenBackgroundColors = [backgroundColor, backgroundColor]
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenBackgroundColors = [backgroundColor, backgroundColor]
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenForegroundColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenForegroundColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.selectionScreenForegroundColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonTextNormalColor = backgroundColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBackgroundNormalColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonTextHighlightColor = backgroundColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBackgroundHighlightColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBorderColor = UIColor.clear
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBorderWidth = 0
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonCornerRadius = 30
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenTextBackgroundColor = backgroundColor
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenTextBackgroundBorderColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenTextBackgroundBorderWidth = 2
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenTextBackgroundCornerRadius = 5
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenTextBackgroundColor = backgroundColor
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenTextBackgroundBorderColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenTextBackgroundBorderWidth = 2
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenTextBackgroundCornerRadius = 5
//            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenPassportFrameImage = UIImage(named: "zoom_passport_frame_green")
//            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenIDCardFrameImage = UIImage(named: "zoom_id_card_frame_green")
            // Result Screen Customization
            ZoomGlobalState.currentCustomization.resultScreenCustomization.backgroundColors = [backgroundColor, backgroundColor]
            ZoomGlobalState.currentCustomization.resultScreenCustomization.foregroundColor = primaryColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.activityIndicatorColor = primaryColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.resultAnimationBackgroundColor = primaryColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.resultAnimationForegroundColor = backgroundColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.uploadProgressTrackColor = UIColor.black.withAlphaComponent(0.2)
            ZoomGlobalState.currentCustomization.resultScreenCustomization.uploadProgressFillColor = primaryColor
            // Feedback Customization
            ZoomGlobalState.currentCustomization.feedbackCustomization.backgroundColor = backgroundLayer
            ZoomGlobalState.currentCustomization.feedbackCustomization.textColor = backgroundColor
            ZoomGlobalState.currentCustomization.feedbackCustomization.cornerRadius = 5
            // Frame Customization
            ZoomGlobalState.currentCustomization.frameCustomization.backgroundColor = backgroundColor
            ZoomGlobalState.currentCustomization.frameCustomization.borderColor = UIColor.clear
            ZoomGlobalState.currentCustomization.frameCustomization.borderWidth = 0
            ZoomGlobalState.currentCustomization.frameCustomization.cornerRadius = 20
            // Oval Customization
            ZoomGlobalState.currentCustomization.ovalCustomization.strokeColor = primaryColor
            ZoomGlobalState.currentCustomization.ovalCustomization.progressColor1 = primaryColor
            ZoomGlobalState.currentCustomization.ovalCustomization.progressColor2 = primaryColor
            // Cancel Button Customization
            ZoomGlobalState.currentCustomization.cancelButtonCustomization.customImage = UIImage(named: "cancel_round_green")
//            ZoomGlobalState.currentCustomization.cancelButtonCustomization.customImageLowLight = UIImage(named: "cancel_round_green")
        }
        else if theme == "Dark-Side" {
            let primaryColor = UIColor(red: 0, green: 0.675, blue: 0.929, alpha: 1) // blue
            let backgroundColor = UIColor.black
            let backgroundLayer = CAGradientLayer.init()
            backgroundLayer.colors = [primaryColor.cgColor, primaryColor.cgColor]
            backgroundLayer.locations = [0,1]
            backgroundLayer.startPoint = CGPoint.init(x: 0, y: 0)
            backgroundLayer.endPoint = CGPoint.init(x: 1, y: 0)
            
            // Overlay Customization
//            ZoomGlobalState.currentCustomization.overlayCustomization.blurEffectStyle = .off
//            ZoomGlobalState.currentCustomization.overlayCustomization.blurEffectOpacity = 0
            ZoomGlobalState.currentCustomization.overlayCustomization.backgroundColor = UIColor.black
            ZoomGlobalState.currentCustomization.overlayCustomization.brandingImage = UIImage.init()
            // Guidance Customization
            ZoomGlobalState.currentCustomization.guidanceCustomization.backgroundColors = [backgroundColor, backgroundColor]
            ZoomGlobalState.currentCustomization.guidanceCustomization.foregroundColor = primaryColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonTextNormalColor = primaryColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBackgroundNormalColor = UIColor.clear
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonTextHighlightColor = backgroundColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBackgroundHighlightColor = primaryColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBorderColor = primaryColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBorderWidth = 1
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonCornerRadius = 2
            ZoomGlobalState.currentCustomization.guidanceCustomization.readyScreenOvalFillColor = primaryColor.withAlphaComponent(0.2)
            // Guidance Image Customization
//            ZoomGlobalState.currentCustomization.guidanceCustomization.imageCustomization.cameraPermissionsScreenImage = UIImage(named: "camera_blue")
            // ID Scan Customization
            ZoomGlobalState.currentCustomization.idScanCustomization.selectionScreenBrandingImage = UIImage.init()
            ZoomGlobalState.currentCustomization.idScanCustomization.showSelectionScreenBrandingImage = false
            ZoomGlobalState.currentCustomization.idScanCustomization.selectionScreenBackgroundColors = [backgroundColor, backgroundColor]
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenBackgroundColors = [backgroundColor, backgroundColor]
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenForegroundColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenForegroundColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.selectionScreenForegroundColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonTextNormalColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBackgroundNormalColor = UIColor.clear
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonTextHighlightColor = backgroundColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBackgroundHighlightColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBorderColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBorderWidth = 1
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonCornerRadius = 2
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenTextBackgroundColor = UIColor.clear
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenTextBackgroundBorderColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenTextBackgroundBorderWidth = 2
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenTextBackgroundCornerRadius = 8
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenTextBackgroundColor = UIColor.clear
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenTextBackgroundBorderColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenTextBackgroundBorderWidth = 2
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenTextBackgroundCornerRadius = 8
//            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenPassportFrameImage = UIImage(named: "zoom_passport_frame_blue")
//            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenIDCardFrameImage = UIImage(named: "zoom_id_card_frame_blue")
            // Result Screen Customization
            ZoomGlobalState.currentCustomization.resultScreenCustomization.backgroundColors = [backgroundColor, backgroundColor]
            ZoomGlobalState.currentCustomization.resultScreenCustomization.foregroundColor = primaryColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.activityIndicatorColor = primaryColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.resultAnimationBackgroundColor = primaryColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.resultAnimationForegroundColor = backgroundColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.uploadProgressTrackColor = UIColor.white.withAlphaComponent(0.2)
            ZoomGlobalState.currentCustomization.resultScreenCustomization.uploadProgressFillColor = primaryColor
            // Feedback Customization
            ZoomGlobalState.currentCustomization.feedbackCustomization.backgroundColor = backgroundLayer
            ZoomGlobalState.currentCustomization.feedbackCustomization.textColor = backgroundColor
            ZoomGlobalState.currentCustomization.feedbackCustomization.cornerRadius = 8
            // Frame Customization
            ZoomGlobalState.currentCustomization.frameCustomization.backgroundColor = backgroundColor
            ZoomGlobalState.currentCustomization.frameCustomization.borderColor = primaryColor
            ZoomGlobalState.currentCustomization.frameCustomization.borderWidth = 2
            ZoomGlobalState.currentCustomization.frameCustomization.cornerRadius = 8
            // Oval Customization
            ZoomGlobalState.currentCustomization.ovalCustomization.strokeColor = primaryColor
            ZoomGlobalState.currentCustomization.ovalCustomization.progressColor1 = primaryColor.withAlphaComponent(0.5)
            ZoomGlobalState.currentCustomization.ovalCustomization.progressColor2 = primaryColor.withAlphaComponent(0.5)
            // Cancel Button Customization
            ZoomGlobalState.currentCustomization.cancelButtonCustomization.customImage = UIImage(named: "double_chevron_left_blue")
//            ZoomGlobalState.currentCustomization.cancelButtonCustomization.customImageLowLight = UIImage(named: "double_chevron_left_blue")
        }
        else if theme == "Bitcoin Exchange" {
            let primaryColor = UIColor(red: 0.969, green: 0.588, blue: 0.204, alpha: 1) // orange
            let secondaryColor = UIColor(red: 1, green: 1, blue: 0.188, alpha: 1) // yellow
            let backgroundColor = UIColor(red: 0.259, green: 0.259, blue: 0.259, alpha: 1) // dark grey
            let backgroundLayer = CAGradientLayer.init()
            backgroundLayer.colors = [primaryColor.cgColor, primaryColor.cgColor]
            backgroundLayer.locations = [0,1]
            backgroundLayer.startPoint = CGPoint.init(x: 0, y: 0)
            backgroundLayer.endPoint = CGPoint.init(x: 1, y: 0)
            
            // Overlay Customization
//            ZoomGlobalState.currentCustomization.overlayCustomization.blurEffectStyle = .off
//            ZoomGlobalState.currentCustomization.overlayCustomization.blurEffectOpacity = 0
            ZoomGlobalState.currentCustomization.overlayCustomization.backgroundColor = UIColor.white
            ZoomGlobalState.currentCustomization.overlayCustomization.brandingImage = UIImage(named: "bitcoin_exchange_logo")
            // Guidance Customization
            ZoomGlobalState.currentCustomization.guidanceCustomization.backgroundColors = [backgroundColor, backgroundColor]
            ZoomGlobalState.currentCustomization.guidanceCustomization.foregroundColor = primaryColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonTextNormalColor = backgroundColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBackgroundNormalColor = primaryColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonTextHighlightColor = backgroundColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBackgroundHighlightColor = primaryColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBorderColor = UIColor.clear
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBorderWidth = 0
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonCornerRadius = 5
            ZoomGlobalState.currentCustomization.guidanceCustomization.readyScreenOvalFillColor = primaryColor.withAlphaComponent(0.2)
            // Guidance Image Customization
//            ZoomGlobalState.currentCustomization.guidanceCustomization.imageCustomization.cameraPermissionsScreenImage = UIImage(named: "camera_orange")
            // ID Scan Customization
            ZoomGlobalState.currentCustomization.idScanCustomization.selectionScreenBrandingImage = UIImage.init()
            ZoomGlobalState.currentCustomization.idScanCustomization.showSelectionScreenBrandingImage = false
            ZoomGlobalState.currentCustomization.idScanCustomization.selectionScreenBackgroundColors = [backgroundColor, backgroundColor]
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenBackgroundColors = [backgroundColor, backgroundColor]
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenForegroundColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenForegroundColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.selectionScreenForegroundColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonTextNormalColor = backgroundColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBackgroundNormalColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonTextHighlightColor = backgroundColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBackgroundHighlightColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBorderColor = UIColor.clear
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBorderWidth = 0
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonCornerRadius = 5
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenTextBackgroundColor = backgroundColor
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenTextBackgroundBorderColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenTextBackgroundBorderWidth = 0
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenTextBackgroundCornerRadius = 8
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenTextBackgroundColor = backgroundColor
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenTextBackgroundBorderColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenTextBackgroundBorderWidth = 0
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenTextBackgroundCornerRadius = 8
//            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenPassportFrameImage = UIImage(named: "zoom_passport_frame_orange")
//            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenIDCardFrameImage = UIImage(named: "zoom_id_card_frame_orange")
            // Result Screen Customization
            ZoomGlobalState.currentCustomization.resultScreenCustomization.backgroundColors = [backgroundColor, backgroundColor]
            ZoomGlobalState.currentCustomization.resultScreenCustomization.foregroundColor = primaryColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.activityIndicatorColor = primaryColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.resultAnimationBackgroundColor = primaryColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.resultAnimationForegroundColor = backgroundColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.uploadProgressTrackColor = UIColor.black.withAlphaComponent(0.2)
            ZoomGlobalState.currentCustomization.resultScreenCustomization.uploadProgressFillColor = primaryColor
            // Feedback Customization
            ZoomGlobalState.currentCustomization.feedbackCustomization.backgroundColor = backgroundLayer
            ZoomGlobalState.currentCustomization.feedbackCustomization.textColor = backgroundColor
            ZoomGlobalState.currentCustomization.feedbackCustomization.cornerRadius = 5
            // Frame Customization
            ZoomGlobalState.currentCustomization.frameCustomization.backgroundColor = backgroundColor
            ZoomGlobalState.currentCustomization.frameCustomization.borderColor = secondaryColor
            ZoomGlobalState.currentCustomization.frameCustomization.borderWidth = 0
            ZoomGlobalState.currentCustomization.frameCustomization.cornerRadius = 5
            // Oval Customization
            ZoomGlobalState.currentCustomization.ovalCustomization.strokeColor = primaryColor
            ZoomGlobalState.currentCustomization.ovalCustomization.progressColor1 = secondaryColor
            ZoomGlobalState.currentCustomization.ovalCustomization.progressColor2 = secondaryColor
            // Cancel Button Customization
            ZoomGlobalState.currentCustomization.cancelButtonCustomization.customImage = UIImage(named: "back_orange")
//            ZoomGlobalState.currentCustomization.cancelButtonCustomization.customImageLowLight = UIImage(named: "back_orange")
        }
        else if theme == "eKYC" {
            let primaryColor = UIColor(red: 0.929, green: 0.110, blue: 0.141, alpha: 1) // red
            let secondaryColor = UIColor.black
            let backgroundColor = UIColor.white
            let backgroundLayer = CAGradientLayer.init()
            backgroundLayer.colors = [secondaryColor.cgColor, secondaryColor.cgColor]
            backgroundLayer.locations = [0,1]
            backgroundLayer.startPoint = CGPoint.init(x: 0, y: 0)
            backgroundLayer.endPoint = CGPoint.init(x: 1, y: 0)
            
            // Overlay Customization
//            ZoomGlobalState.currentCustomization.overlayCustomization.blurEffectStyle = .off
//            ZoomGlobalState.currentCustomization.overlayCustomization.blurEffectOpacity = 0
            ZoomGlobalState.currentCustomization.overlayCustomization.backgroundColor = UIColor.clear
            ZoomGlobalState.currentCustomization.overlayCustomization.brandingImage = UIImage(named: "ekyc_logo")
            // Guidance Customization
            ZoomGlobalState.currentCustomization.guidanceCustomization.backgroundColors = [backgroundColor, backgroundColor]
            ZoomGlobalState.currentCustomization.guidanceCustomization.foregroundColor = secondaryColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonTextNormalColor = primaryColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBackgroundNormalColor = UIColor.clear
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonTextHighlightColor = backgroundColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBackgroundHighlightColor = primaryColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBorderColor = primaryColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBorderWidth = 2
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonCornerRadius = 8
            ZoomGlobalState.currentCustomization.guidanceCustomization.readyScreenOvalFillColor = primaryColor.withAlphaComponent(0.2)
            // Guidance Image Customization
//            ZoomGlobalState.currentCustomization.guidanceCustomization.imageCustomization.cameraPermissionsScreenImage = UIImage(named: "camera_red")
            // ID Scan Customization
            ZoomGlobalState.currentCustomization.idScanCustomization.selectionScreenBrandingImage = UIImage(named: "ekyc_logo")
            ZoomGlobalState.currentCustomization.idScanCustomization.showSelectionScreenBrandingImage = true
            ZoomGlobalState.currentCustomization.idScanCustomization.selectionScreenBackgroundColors = [backgroundColor, backgroundColor]
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenBackgroundColors = [backgroundColor, backgroundColor]
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenForegroundColor = backgroundColor
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenForegroundColor = backgroundColor
            ZoomGlobalState.currentCustomization.idScanCustomization.selectionScreenForegroundColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonTextNormalColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBackgroundNormalColor = UIColor.clear
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonTextHighlightColor = backgroundColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBackgroundHighlightColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBorderColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBorderWidth = 2
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonCornerRadius = 8
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenTextBackgroundColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenTextBackgroundBorderColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenTextBackgroundBorderWidth = 0
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenTextBackgroundCornerRadius = 2
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenTextBackgroundColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenTextBackgroundBorderColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenTextBackgroundBorderWidth = 0
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenTextBackgroundCornerRadius = 2
//            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenPassportFrameImage = UIImage(named: "zoom_passport_frame_red")
//            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenIDCardFrameImage = UIImage(named: "zoom_id_card_frame_red")
            // Result Screen Customization
            ZoomGlobalState.currentCustomization.resultScreenCustomization.backgroundColors = [backgroundColor, backgroundColor]
            ZoomGlobalState.currentCustomization.resultScreenCustomization.foregroundColor = secondaryColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.activityIndicatorColor = primaryColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.resultAnimationBackgroundColor = primaryColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.resultAnimationForegroundColor = backgroundColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.uploadProgressTrackColor = UIColor.black.withAlphaComponent(0.2)
            ZoomGlobalState.currentCustomization.resultScreenCustomization.uploadProgressFillColor = primaryColor
            // Feedback Customization
            ZoomGlobalState.currentCustomization.feedbackCustomization.backgroundColor = backgroundLayer
            ZoomGlobalState.currentCustomization.feedbackCustomization.textColor = backgroundColor
            ZoomGlobalState.currentCustomization.feedbackCustomization.cornerRadius = 3
            // Frame Customization
            ZoomGlobalState.currentCustomization.frameCustomization.backgroundColor = backgroundColor
            ZoomGlobalState.currentCustomization.frameCustomization.borderColor = primaryColor
            ZoomGlobalState.currentCustomization.frameCustomization.borderWidth = 2
            ZoomGlobalState.currentCustomization.frameCustomization.cornerRadius = 8
            // Oval Customization
            ZoomGlobalState.currentCustomization.ovalCustomization.strokeColor = primaryColor
            ZoomGlobalState.currentCustomization.ovalCustomization.progressColor1 = primaryColor.withAlphaComponent(0.5)
            ZoomGlobalState.currentCustomization.ovalCustomization.progressColor2 = primaryColor.withAlphaComponent(0.5)
            // Cancel Button Customization
            ZoomGlobalState.currentCustomization.cancelButtonCustomization.customImage = UIImage(named: "cancel_box_red")
//            ZoomGlobalState.currentCustomization.cancelButtonCustomization.customImageLowLight = UIImage(named: "cancel_box_red")
        }
        else if theme == "Sample Bank" {
            let primaryColor = UIColor.white
            let secondaryColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1)
            let backgroundColor = UIColor(red: 0.114, green: 0.090, blue: 0.310, alpha: 1) // navy
            let backgroundLayer = CAGradientLayer.init()
            backgroundLayer.colors = [primaryColor.cgColor, primaryColor.cgColor]
            backgroundLayer.locations = [0,1]
            backgroundLayer.startPoint = CGPoint.init(x: 0, y: 0)
            backgroundLayer.endPoint = CGPoint.init(x: 1, y: 0)

            // Overlay Customization
//            ZoomGlobalState.currentCustomization.overlayCustomization.blurEffectStyle = .off
//            ZoomGlobalState.currentCustomization.overlayCustomization.blurEffectOpacity = 0
            ZoomGlobalState.currentCustomization.overlayCustomization.backgroundColor = primaryColor
            ZoomGlobalState.currentCustomization.overlayCustomization.brandingImage = UIImage(named: "sample_bank_logo")
            // Guidance Customization
            ZoomGlobalState.currentCustomization.guidanceCustomization.backgroundColors = [backgroundColor, backgroundColor]
            ZoomGlobalState.currentCustomization.guidanceCustomization.foregroundColor = primaryColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonTextNormalColor = backgroundColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBackgroundNormalColor = primaryColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonTextHighlightColor = backgroundColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBackgroundHighlightColor = primaryColor.withAlphaComponent(0.8)
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBorderColor = primaryColor
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonBorderWidth = 2
            ZoomGlobalState.currentCustomization.guidanceCustomization.buttonCornerRadius = 2
            ZoomGlobalState.currentCustomization.guidanceCustomization.readyScreenOvalFillColor = primaryColor.withAlphaComponent(0.2)
            // Guidance Image Customization
//            ZoomGlobalState.currentCustomization.guidanceCustomization.imageCustomization.cameraPermissionsScreenImage = UIImage(named: "camera_white_navy")
            // ID Scan Customization
            ZoomGlobalState.currentCustomization.idScanCustomization.selectionScreenBrandingImage = UIImage(named: "sample_bank_logo")
            ZoomGlobalState.currentCustomization.idScanCustomization.showSelectionScreenBrandingImage = true
            ZoomGlobalState.currentCustomization.idScanCustomization.selectionScreenBackgroundColors = [backgroundColor, backgroundColor]
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenBackgroundColors = [backgroundColor, backgroundColor]
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenForegroundColor = backgroundColor
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenForegroundColor = backgroundColor
            ZoomGlobalState.currentCustomization.idScanCustomization.selectionScreenForegroundColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonTextNormalColor = backgroundColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBackgroundNormalColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonTextHighlightColor = backgroundColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBackgroundHighlightColor = primaryColor.withAlphaComponent(0.8)
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBorderColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonBorderWidth = 2
            ZoomGlobalState.currentCustomization.idScanCustomization.buttonCornerRadius = 2
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenTextBackgroundColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenTextBackgroundBorderColor = backgroundColor
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenTextBackgroundBorderWidth = 2
            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenTextBackgroundCornerRadius = 2
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenTextBackgroundColor = primaryColor
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenTextBackgroundBorderColor = backgroundColor
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenTextBackgroundBorderWidth = 2
            ZoomGlobalState.currentCustomization.idScanCustomization.reviewScreenTextBackgroundCornerRadius = 2
//            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenPassportFrameImage = UIImage(named: "zoom_passport_frame_navy")
//            ZoomGlobalState.currentCustomization.idScanCustomization.captureScreenIDCardFrameImage = UIImage(named: "zoom_id_card_frame_navy")
            // Result Screen Customization
            ZoomGlobalState.currentCustomization.resultScreenCustomization.backgroundColors = [backgroundColor, backgroundColor]
            ZoomGlobalState.currentCustomization.resultScreenCustomization.foregroundColor = primaryColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.activityIndicatorColor = primaryColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.resultAnimationBackgroundColor = primaryColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.resultAnimationForegroundColor = backgroundColor
            ZoomGlobalState.currentCustomization.resultScreenCustomization.uploadProgressTrackColor = UIColor.white.withAlphaComponent(0.2)
            ZoomGlobalState.currentCustomization.resultScreenCustomization.uploadProgressFillColor = primaryColor
            // Feedback Customization
            ZoomGlobalState.currentCustomization.feedbackCustomization.backgroundColor = backgroundLayer
            ZoomGlobalState.currentCustomization.feedbackCustomization.textColor = backgroundColor
            ZoomGlobalState.currentCustomization.feedbackCustomization.cornerRadius = 2
            // Frame Customization
            ZoomGlobalState.currentCustomization.frameCustomization.backgroundColor = backgroundColor
            ZoomGlobalState.currentCustomization.frameCustomization.borderColor = primaryColor
            ZoomGlobalState.currentCustomization.frameCustomization.borderWidth = 2
            ZoomGlobalState.currentCustomization.frameCustomization.cornerRadius = 2
            // Oval Customization
            ZoomGlobalState.currentCustomization.ovalCustomization.strokeColor = secondaryColor
            ZoomGlobalState.currentCustomization.ovalCustomization.progressColor1 = primaryColor.withAlphaComponent(0.5)
            ZoomGlobalState.currentCustomization.ovalCustomization.progressColor2 = primaryColor.withAlphaComponent(0.5)
            // Cancel Button Customization
            ZoomGlobalState.currentCustomization.cancelButtonCustomization.customImage = UIImage(named: "cancel_white")
//            ZoomGlobalState.currentCustomization.cancelButtonCustomization.customImageLowLight = UIImage(named: "cancel_navy")
        }
        
        FaceTec.sdk.setCustomization(ZoomGlobalState.currentCustomization)
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

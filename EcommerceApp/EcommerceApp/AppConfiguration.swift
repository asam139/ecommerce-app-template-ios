//
//  AppConfiguration.swift
//  EcommerceApp
//
//  Created by Florian Marcu on 2/12/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

public final class AppConfiguration {
    
    // Log In
    public static let isLoginScreenEnabled = true
    
    // Facebook
    public static let isFacebookLoginEnabled = true
    
    // Twitter
    public static let isTwitterLoginEnabled = false
    public static let twitterConsumerKey = ""
    public static let twitterConsumerSecret = ""

    // Firebase
    public static let isFirebaseIntegrationEnabled = false

    // Stripe
    public static let isStripePaymentEnabled = true
    public static let stripePublishableKey = "pk_test_mHeSRjRFtORVXYQeFZty7pZD"
    public static let isApplePaymentEnabled = false
    public static let applePayMerchantIdentifier = "Your Apple Merchant Identifier"
}

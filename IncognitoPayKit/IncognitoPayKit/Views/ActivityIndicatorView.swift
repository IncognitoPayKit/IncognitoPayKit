//
//  ActivityIndicatorView.swift
//  IncognitoPayKit
//
//  Created by Andreas Reuter on 26.12.20.
//  Copyright © 2020 NO DANCE MONKEY. All rights reserved.
//

import UIKit

class ActivityIndicatorView: UIView {
  override func willMove(toWindow newWindow: UIWindow?) {
    super.willMove(toWindow: newWindow)
    
    var indicatorStyle: UIActivityIndicatorView.Style
    if #available(iOS 13.0, *) {
      indicatorStyle = UIActivityIndicatorView.Style.large
    } else {
      // Fallback on earlier versions
      indicatorStyle = UIActivityIndicatorView.Style.whiteLarge
    }
    
    let activityIndicator = UIActivityIndicatorView(
      style: indicatorStyle
    )
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    activityIndicator.startAnimating()
    
    let activityIndicatorView = UIView(frame: activityIndicator.frame)
    activityIndicatorView.backgroundColor = UIColor(white: 0, alpha: 0.7)
    activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
    activityIndicatorView.addSubview(activityIndicator)
    
    frame = activityIndicatorView.frame
    
    addSubview(activityIndicatorView)
    
    NSLayoutConstraint.activate([
      activityIndicatorView.centerYAnchor.constraint(
        equalTo: centerYAnchor,
        constant: -frame.height / 2
      ),
      activityIndicatorView.centerXAnchor.constraint(
        equalTo: centerXAnchor,
        constant: -frame.width / 2
      )
    ])
  }
}

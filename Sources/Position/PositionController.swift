//
//  PositionController.swift
//  Pods-Demo
//
//  Created by Jérémy Marchand on 04/03/2018.
//

import Foundation

protocol PositionController: AnyObject {
    var isEnabled: Bool { get set }

    func click(_ sender: LongPressGestureRecogniser)
    func playOrPause(_ sender: Any)
}

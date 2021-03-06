/*
 *  BaseDefinitions.swift
 *  ScheduleKit
 *
 *  Created:    Guillem Servera on 24/12/2014.
 *  Copyright:  © 2014-2019 Guillem Servera (https://github.com/gservera)
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 */

import Cocoa

/// The shared calendar object used by the ScheduleKit framework.
var sharedCalendar = Calendar.current

/// A `Double` value that represents relative time points between the lower and
/// upper date bounds in a concrete `SCKView` subclass. Valid values are the ones
/// between 0.0 and 1.0, which represent the start date and the end date, 
/// respectively. Any other values are not valid and should be represented using
/// `SCKRelativeTimeLocationInvalid`.
internal typealias SCKRelativeTimeLocation = Double

/// A `Double` value that represents the relative length (in percentage) for an
/// event in a concrete `SCKView` subclass. Valid values are the ones
/// between 0.0 and 1.0, which represent zero-length and full length values,
/// respectively. Behaviour when using any other values in undefined.
internal typealias SCKRelativeTimeLength = Double

/// A fallback value generated by ScheduleKit the date of an event object used
/// in a `SCKView` subclass does not fit in the view's date interval.
internal let SCKRelativeTimeLocationInvalid = SCKRelativeTimeLocation(-Int.max)

/// A fallback value generated by ScheduleKit the duration of an event object used
/// in a `SCKView` subclass is invalid (negative or too wide).
internal let SCKRelativeTimeLengthInvalid = SCKRelativeTimeLocation.leastNormalMagnitude

/// Possible color styles for drawing event view backgrounds.
@objc public enum SCKEventColorMode: Int {

    /// Colors events according to their event kind.
    case byEventKind

    /// Colors events according to their user's event color.
    case byEventOwner
}

extension Calendar {

    func dateInterval(_ interval: DateInterval, offsetBy value: Int, _ unit: Calendar.Component) -> DateInterval {
        let start = date(byAdding: unit, value: value, to: interval.start)
        let end = date(byAdding: unit, value: value, to: interval.end)
        return DateInterval(start: start!, end: end!)
    }

}

extension NSTextField {

    static func makeLabel(fontSize: CGFloat, color: NSColor) -> NSTextField {
        let label = NSTextField(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isBordered = false
        label.isEditable = false
        label.isBezeled = false
        label.drawsBackground = false
        label.font = .systemFont(ofSize: fontSize)
        label.textColor = color
        return label
    }

}

extension CGRect {
    static func fill(_ xPos: CGFloat, _ yPos: CGFloat, _ wDim: CGFloat, _ hDim: CGFloat) {
        CGRect(x: xPos, y: yPos, width: wDim, height: hDim).fill()
    }
}

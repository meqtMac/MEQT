//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/18.
//
/// Types that are convertible from MEQT integer values.
public protocol MEQTFloatingPointConvertable {}
/// Types that are convertible from floating point values.
public protocol MEQTIntegerConvertable {}

/// Floating Point Types that supported by MEQT
public protocol MEQTFloatingPoint: MEQTFloatingPointConvertable {}
extension Float: MEQTFloatingPoint {}
extension Double: MEQTFloatingPoint {}

/// Interger Types that supported by MEQT
protocol MEQTInteger {}
protocol MEQTUnsignedInteger: MEQTInteger {}
protocol MEQTSignedInteger: MEQTInteger {}

extension Int: MEQTSignedInteger {}
extension Int8: MEQTSignedInteger {}
extension Int16: MEQTSignedInteger {}
extension Int32: MEQTSignedInteger {}
extension Int64: MEQTSignedInteger {}

extension UInt: MEQTUnsignedInteger {}
extension UInt8: MEQTUnsignedInteger{}
extension UInt16: MEQTUnsignedInteger{}
extension UInt32: MEQTUnsignedInteger {}
extension UInt64: MEQTUnsignedInteger {}

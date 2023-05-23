//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/22.
//

#if canImport(Accelerate)
import Accelerate
extension Double: VectorElement, MEQTMatrixElement {}
extension Double: MEQTElement {
    public var descript: String {
        String(format: "%.1g", self)
    }
}
#endif

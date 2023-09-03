//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/6/22.
//

#if canImport(Accelerate)
import Accelerate
extension Float: VectorElement, MEQTMatrixElement { }

extension Float: MEQTElement {
    public var descript: String {
        String(format: "%.g", self)
    }
}
#endif

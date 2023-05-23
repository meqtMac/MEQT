//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/22.
//

// MARK: Extrama
public func maximum<T>(_ buffer: T) -> T.Element where T: MEQTBufferExtrama {
    T.maximum(buffer)
}
public func minimum<T>(_ buffer: T) -> T.Element where T: MEQTBufferExtrama {
    T.minimum(buffer)
}
public func maximumMagnitude<T>(_ buffer: T) -> T.Element where T: MEQTBufferExtrama {
    T.maximumMagnitude(buffer)
}

// TODO: indexed
//public func indexOfMaximum<T>(_ buffer: T) -> (Int, T.Element) where T: MEQTVectorBuffer {
//    T.indexOfMaximum(buffer)
//}

//public func indexOfMaximumMagnitude<T>(_ buffer: T) -> (Int, T.Element) where T: MEQTBufferExtrama {
//    T.indexOfMaximumMagnitude(buffer)
//}

//public func indexOfMinimum<T>(_ buffer: T) -> (Int, T.Element) where T: MEQTBufferExtrama {
//    T.indexOfMinimum(buffer)
//}


// MARK: Average
public func mean<T>( _ buffer: T ) -> T.Element where T: MEQTBufferAverage {
    T.mean(buffer)
}
public func meanMagintude<T>(_ buffer: T) -> T.Element where T: MEQTBufferAverage {
    T.meanMagintude(buffer)
}

public func meanSquare<T>(_ buffer: T) -> T.Element where T: MEQTBufferAverage {
    T.meanSquare(buffer)
}
public func rootMeanSquare<T>(_ buffer: T) -> T.Element where T: MEQTBufferAverage {
    T.rootMeanSquare(buffer)
}

// MARK: Sum
public func sum<T>(_ buffer: T) -> T.Element where T: MEQTBufferSum {
    T.sum(buffer)
}

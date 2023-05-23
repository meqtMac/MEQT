//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/22.
//


// MARK: Arithmetic
public func add<T>(
    _ lhs: T,
    _ rhs: T,
    result: inout T
) where T: MEQTBufferArithmetic {
    T.add(lhs, rhs, result: &result)
}

public func add<T>(
    _ lhs: T,
    _ rhs: T
) -> T where T: MEQTBufferArithmetic {
    T.add(lhs, rhs)
}

public func add<T>(
    _ lhs: T,
    _ rhs: T.Element,
    result: inout T
) where T: MEQTBufferArithmetic {
    T.add(lhs, rhs, result: &result)
}

public func add<T>(
    _ lhs: T,
    _ rhs: T.Element
) -> T where T: MEQTBufferArithmetic {
    T.add(lhs, rhs)
}


public func add<T>(
    _ lhs: T.Element,
    _ rhs: T,
    result: inout T
) where T: MEQTBufferArithmetic {
    T.add(lhs, rhs, result: &result)
}

public func add<T>(
    _ lhs: T.Element,
    _ rhs: T
) -> T where T: MEQTBufferArithmetic {
    T.add(rhs, rhs)
}

public func subtract<T>(
    _ lhs: T,
    _ rhs: T,
    result: inout T
)  where T: MEQTBufferArithmetic {
    T.subtract(lhs, rhs, result: &result)
}

public func subtract<T>(
    _ lhs: T,
    _ rhs: T
) -> T where T: MEQTBufferArithmetic {
    T.subtract(lhs, rhs)
}

public func subtract<T>(
    _ lhs: T,
    _ rhs: T.Element,
    result: inout T
) where T: MEQTBufferArithmetic {
    T.subtract(lhs, rhs, result: &result)
}

public func subtract<T>(
    _ lhs: T,
    _ rhs: T.Element
) -> T where T: MEQTBufferArithmetic {
    T.subtract(lhs, rhs)
}


public func subtract<T>(
    _ lhs: T.Element,
    _ rhs: T,
    result: inout T
)  where T: MEQTBufferArithmetic {
    T.subtract(lhs, rhs, result: &result)
}

public func subtract<T>(
    _ lhs: T.Element,
    _ rhs: T
) -> T where T: MEQTBufferArithmetic {
    T.subtract(lhs, rhs)
}

public func multiply<T>(
    _ lhs: T,
    _ rhs: T,
    result: inout T
)  where T: MEQTBufferArithmetic {
    T.multiply(lhs, rhs, result: &result)
}

public func multiply<T>(
    _ lhs: T,
    _ rhs: T
) -> T where T: MEQTBufferArithmetic {
    T.multiply(lhs, rhs)
}

public func multiply<T>(
    _ lhs: T,
    _ rhs: T.Element,
    result: inout T
) where T: MEQTBufferArithmetic {
    T.multiply(lhs, rhs, result: &result)
}

public func multiply<T>(
    _ lhs: T,
    _ rhs: T.Element
) -> T where T: MEQTBufferArithmetic {
    T.multiply(lhs, rhs)
}


public func multiply<T>(
    _ lhs: T.Element,
    _ rhs: T,
    result: inout T
) where T: MEQTBufferArithmetic {
    T.multiply(lhs, rhs, result: &result)
}

public func multiply<T>(
    _ lhs: T.Element,
    _ rhs: T
) -> T where T: MEQTBufferArithmetic {
    T.multiply(lhs, rhs)
}

public func divide<T>(
    _ lhs: T,
    _ rhs: T,
    result: inout T
) where T: MEQTBufferArithmetic {
    T.divide(lhs, rhs, result: &result)
}

public func divide<T>(
    _ lhs: T,
    _ rhs: T
) -> T where T: MEQTBufferArithmetic {
    T.divide(lhs, rhs)
}

public func divide<T>(
    _ lhs: T,
    _ rhs: T.Element,
    result: inout T
) where T: MEQTBufferArithmetic {
    T.divide(lhs, rhs, result: &result)
}

public func divide<T>(
    _ lhs: T,
    _ rhs: T.Element
) -> T where T: MEQTBufferArithmetic {
    T.divide(lhs, rhs)
}


public func divide<T>(
    _ lhs: T.Element,
    _ rhs: T,
    result: inout T
) where T: MEQTBufferArithmetic {
    T.divide(lhs, rhs, result: &result)
}

public func divide<T>(
    _ lhs: T.Element,
    _ rhs: T
) -> T where T: MEQTBufferArithmetic {
    T.divide(lhs, rhs)
}

// MARK: Hypotenuse
public func hypot<T>(
    _ lhs: T,
    _ rhs: T,
    result: inout T
) where T: MEQTBufferHypotenuse {
    T.hypot(lhs, rhs, result: &result)
}

public func hypot<T>(
    _ lhs: T,
    _ rhs: T
) -> T where T: MEQTBufferHypotenuse {
    T.hypot(lhs, rhs)
}

// MARK: Distance
public func distanceSquared<T>(
    _ lhs: T,
    _ rhs: T
) -> T.Element where T: MEQTBufferDistance {
    T.distanceSquared(lhs, rhs)
}

// MARK: TaperMerger
public func taperedMerge<T>(
    _ lhs: T,
    _ rhs: T,
    result: inout T
) where T: MEQTBufferTaperMerge {
    T.taperedMerge(lhs, rhs, result: &result)
}
public func taperedMerge<T>(
    _ lhs: T,
    _ rhs: T
) -> T where T: MEQTBufferTaperMerge {
    T.taperedMerge(lhs, rhs)
}

// MARK: LinearInterpolate
public func linearInterpolate<T>(
    _ lhs: T,
    _ rhs: T,
    using interpolationConstant: T.Element,
    result: inout T
) where T: MEQTBufferLinearInterpolate {
    T.linearInterpolate(lhs, rhs, using: interpolationConstant, result: &result)
}
public func linearInterpolate<T>(
    _ lhs: T,
    _ rhs: T,
    using interpolationConstant: T.Element
) -> T where T: MEQTBufferLinearInterpolate {
    T.linearInterpolate(lhs, rhs, using: interpolationConstant)
}


//public func linearInterpolate<T>(
//    elementsOf vector: T,
//    using controlVector: T,
//    result: inout T
//) where T: MEQTVectorBuffer, T.Element: VectorLinearInterpolate {
//    T.Element.lin
//    T.linearInterpolate(elementsOf: vector, using: controlVector, result: &result)
//}

//public func linearInterpolate<T>(
//    elementsOf vector: T,
//    using controlVector: T
//) -> T where T: MEQTVectorBuffer, T.Element: VectorLinearInterpolate {
//    T.linearInterpolate(elementsOf: vector, using: controlVector)
//}

// MARK: vector vector min max

public func maximum<T>(
    _ lhs: T,
    _ rhs: T
) -> T where T: MEQTBufferMinMax {
    T.maximum(lhs, rhs)
}
public func maximum<T>(
    _ lhs: T,
    _ rhs: T,
    result: inout T
)where T: MEQTBufferMinMax {
    T.maximum(lhs, rhs, result: &result)
}

public func minimum<T>(
    _ lhs: T,
    _ rhs: T
) -> T where T: MEQTBufferMinMax {
    T.minimum(lhs,  rhs)
}

public func minimum<T>(
    _ lhs: T,
    _ rhs: T,
    result: inout T
)where T: MEQTBufferMinMax {
    T.minimum(lhs, rhs, result: &result)
}

// MARK: Envelope
public func envelope<T>(
    _ buffer: T,
    upperBound: T,
    lowerBound: T
) -> T where T: MEQTBufferEnvelope {
    T.envelope(buffer, upperBound: upperBound, lowerBound: lowerBound)
}

public func envelope<T>(
    _ buffer: T,
    upperBound: T,
    lowerBound: T,
    result: inout T
) where T: MEQTBufferEnvelope {
    T.envelope(buffer, upperBound: upperBound, lowerBound: lowerBound, result: &result)
}


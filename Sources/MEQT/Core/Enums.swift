//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/20.
//

public enum ThresholdRule<T> where T: Comparable {
    case clampToThreshold
    case signedConstant(T)
    case zerofill
}

public enum SortOrder {
    case ascending
    case descending
}

public enum IntegrationRule {
    case runningSum
    case simpson
    case trapezoidal
}


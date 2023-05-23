//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/5/18.
//

public protocol VectorElement:
    VectorMap,
    VectorCombine,
    VectorReduce,
    VectorGeneration,
    VectorDSP,
    VectorTransform {}

/*TODO: Complex
 - spectrum & coherence
 - conjuate
 */


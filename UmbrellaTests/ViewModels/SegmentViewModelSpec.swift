//
//  SegmentViewModelSpec.swift
//  UmbrellaTests
//
//  Created by Lucas Correa on 01/11/2018.
//  Copyright © 2018 Security First. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import Umbrella

class SegmentViewModelSpec: QuickSpec {
    
    override func spec() {
        describe("SegmentViewModel") {
            
            beforeEach {
                
            }
            
            it("should create a new SegmentViewModel") {
                let viewModel = SegmentViewModel()
                expect(viewModel).toNot(beNil())
            }
            
            afterEach {
                
            }
        }
    }
}

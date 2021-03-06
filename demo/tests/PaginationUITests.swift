/*
 *  Copyright (c) 2016 Spotify AB.
 *
 *  Licensed to the Apache Software Foundation (ASF) under one
 *  or more contributor license agreements.  See the NOTICE file
 *  distributed with this work for additional information
 *  regarding copyright ownership.  The ASF licenses this file
 *  to you under the Apache License, Version 2.0 (the
 *  "License"); you may not use this file except in compliance
 *  with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 */

import XCTest

class PaginationUITests: UITestCase {
    func testScrollingToBottomOfViewLoadsPaginatedContent() {
        XCUIApplication().collectionViews.staticTexts["Really long list"].tap()
        
        let collectionView = XCUIApplication().collectionViews.element(boundBy: 0)
        var numberOfSwipes = 0
        
        // Load 100 rows (page size = 50), which should be done in under 20 swipes
        while !collectionView.staticTexts["Row number 100"].exists {
            collectionView.swipeUp()
            numberOfSwipes += 1
            
            if numberOfSwipes > 20 {
                XCTFail("Should not have taken over 20 swipes to load paginated content")
                break
            }
        }
        
        // Test succeeded
    }
}

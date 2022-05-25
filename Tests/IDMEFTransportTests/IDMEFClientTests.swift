/*
 * Copyright (C) 2022 Teclib'
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import XCTest
import IDMEF
import FoundationNetworking
@testable import IDMEFTransport

final class IDMEFClientTests: XCTestCase {
    func test1() throws {
        let client = IDMEFClient(url: "http://127.0.0.1:9999")

        let (response, _) = client.send(message: IDMEFExample.message1(fixed: false))

        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            print(response as! HTTPURLResponse)
            XCTFail()
            return
        }
    }

}

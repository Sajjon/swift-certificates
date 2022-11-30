//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftCertificates open source project
//
// Copyright (c) 2022 Apple Inc. and the SwiftCertificates project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftCertificates project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import XCTest
import SwiftASN1
@testable import X509

final class SignatureTests: XCTestCase {
    func testP384Signature() throws {
        // This is the P384 signature over LetsEncrypt Intermediate E1.
        let signatureBytes: [UInt8] = [
            0x30, 0x64, 0x02, 0x30, 0x7B, 0x74,
            0xD5, 0x52, 0x13, 0x8D, 0x61, 0xFE, 0x0D, 0xBA, 0x3F,
            0x03, 0x00, 0x9D, 0xF3, 0xD7, 0x98, 0x84, 0xD9, 0x57,
            0x2E, 0xBD, 0xE9, 0x0F, 0x9C, 0x5C, 0x48, 0x04, 0x21,
            0xF2, 0xCB, 0xB3, 0x60, 0x72, 0x8E, 0x97, 0xD6, 0x12,
            0x4F, 0xCA, 0x44, 0xF6, 0x42, 0xC9, 0xD3, 0x7B, 0x86,
            0xA9, 0x02, 0x30, 0x5A, 0xB1, 0xB1, 0xB4, 0xED, 0xEA,
            0x60, 0x99, 0x20, 0xB1, 0x38, 0x03, 0xCA, 0x3D, 0xA0,
            0x26, 0xB8, 0xEE, 0x6E, 0x2D, 0x4A, 0xF6, 0xC6, 0x66,
            0x1F, 0x33, 0x9A, 0xDB, 0x92, 0x4A, 0xD5, 0xF5, 0x29,
            0x13, 0xC6, 0x70, 0x62, 0x28, 0xBA, 0x23, 0x8C, 0xCF,
            0x3D, 0x2F, 0xCB, 0x82, 0xE9, 0x7F
        ]
        let signature = try Certificate.Signature(
            signatureAlgorithm: .ecdsaWithSHA384,
            signatureBytes: ASN1BitString(bytes: signatureBytes[...])
        )
        guard case .p384 = signature.backing else {
            XCTFail("Invalid signature decode")
            return
        }

        // TODO: test that the signature is valid over the TBSCertificate.
    }
}

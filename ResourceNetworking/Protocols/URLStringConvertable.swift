// Copyright (C) Sergey Kharchenko, 2020 . All rights reserved.
// Автор: Sergey Harchenko

import Foundation

public protocol URLStringConvertable {
    var urlString: String? { get }
}

extension String: URLStringConvertable {
    public var urlString: String? {
        addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
}

extension Int: URLStringConvertable {
    public var urlString: String? {
        "\(self)"
    }
}

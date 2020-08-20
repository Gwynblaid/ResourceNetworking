// Copyright (C) Sergey Kharchenko, 2019 . All rights reserved.
// Описание: Расширения для протокола Resource в котором добавлена связь с ObjectMapper-om

import Foundation

extension Resource where ResourceType: Decodable {
    public init?(path: String,
                 params: [String: URLStringConvertable]?,
                 method: HttpMethod<Data> = .get,
                 headers: [String : String]?) {
        let queryParams = params?.map { URLQueryItem(name: $0.key, value: $0.value.urlString) }
        var urlComponents = URLComponents(string: path)
        urlComponents?.queryItems = queryParams
        guard let url = urlComponents?.url else { return nil }
        self.url = url
		self.method = method
		self.parse = { data in
			return try JSONDecoder().decode(ResourceType.self, from: data)
		}
		self.headers = headers
	}
}

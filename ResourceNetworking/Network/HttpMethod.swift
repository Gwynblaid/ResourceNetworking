// Copyright (C) Sergey Kharchenko, 2019 . All rights reserved.
// Описание: Доступные типы запросов

import Foundation

/// Тип запроса
///
/// - get GET-запрос
/// - post POST-зпрос, передаваемый параметр типа Body - тело запроса(HTTPBody)
/// - put PUT-зпрос, передаваемый параметр типа Body - тело запроса(HTTPBody)
/// - delete DELETE-зпрос,
public enum HttpMethod<Body> {
	case get
	case post(Body)
    case put(Body)
    case delete
}

extension HttpMethod {
	/// Строковое значение, используется для передачи в запрос
	var stringValue: String{
		switch self {
		case .get:
			return "GET"
		case .post:
			return "POST"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
		}
	}
	
	/// Маппер одного типа тела в другой
	///
	/// - Parameter f: функция трансляции типа Body в тип B
	/// - Returns: возвращает HttpMethod с новым типом B
	public func map<B>(f: (Body) -> B) -> HttpMethod<B> {
		switch self {
		case .get:
			return .get
		case .post(let body):
			return .post(f(body))
        case .put(let body):
            return .put(f(body))
        case .delete:
            return .delete
        }
	}
}

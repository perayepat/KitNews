import Foundation
/// KEY : 9e595b90094644d18ffe8c620c82161d

enum NetworkError: Error{
    case badURL
    case decodingError
    case badRequest
    case noData
    case custom(Error)
}

final class APICaller {
    
    static let shared = APICaller()
    
    struct Constatnts{
        static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=9e595b90094644d18ffe8c620c82161d")
    }
    
    private init() {}
    
    public func getTopStories(completion: @escaping (Result<[String], Error>) -> Void){
        guard let url = Constatnts.topHeadlinesURL else {
            completion(.failure(NetworkError.badURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                completion(.failure(NetworkError.custom(error))) //Unknown error
            } else if (response as? HTTPURLResponse)?.statusCode != 200 {
                completion(.failure(NetworkError.badRequest))
            } else {
                guard let data = data else {
                    completion(.failure(NetworkError.noData))
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(APIResonse.self, from: data)
                    print("Articles : \(result.articles.count)")
                }catch{
                    completion(.failure(NetworkError.decodingError))
                }
            }
        }
        task.resume()
    }
}

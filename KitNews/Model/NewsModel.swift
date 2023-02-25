import Foundation

struct APIResonse: Codable{
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
}

// MARK: - Source
struct Source: Codable {
    let name: String
}


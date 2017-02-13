//
//  Article.swift
//  NYTimes
//
//  Created by Steven Bishop on 1/17/17.
//  Copyright © 2017 Steven Bishop. All rights reserved.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Generator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

enum SerializationError: Error {
    case missing(String)
    case invalid(String, Any)
}

fileprivate enum Constants {
    static let url = "url"
    static let webUrl = "web_url"
    static let section = "section"
    static let title = "title"
    static let publishedDate = "published_date"
    static let abstract = "abstract"
    static let snippet = "snippet"
    static let leadParagraph = "lead_paragraph"
    static let media = "media"
    static let mediaMetadata = "media-metadata"
    static let pubDate = "pub_date" // pubishedDate for SearchArticle
    static let typeOfMaterial = "type_of_material"
    static let multimedia = "multimedia"
}

@objc public class SearchArticle: NSObject {

    let webUrl: URL
    let snippet: String
    let publishDate: Date?
    let articleType: String
    let abstract: String?
    let leadParagraph: String?
    let media: ArticleMedia

    init(json: JSONObject) throws {
        guard let url = json[Constants.webUrl] as? String else {
            throw SerializationError.missing(Constants.webUrl)
        }

        guard let webUrl = URL(string: url) else {
            throw SerializationError.invalid("webUrl", url)
        }

        guard let articleType = json[Constants.typeOfMaterial] as? String else {
            throw SerializationError.missing(Constants.typeOfMaterial)
        }

        guard let snippet = json[Constants.snippet] as? String else {
            throw SerializationError.missing(Constants.snippet)
        }

        guard let publishDateString = json[Constants.pubDate] as? String else {
            throw SerializationError.missing(Constants.pubDate)
        }

        guard let publishDate = Formatters.iso8601Formatter.date(from: publishDateString) else {
            throw SerializationError.invalid(Constants.publishedDate, publishDateString)
        }

        if let abstract = json[Constants.abstract] as? String {
            self.abstract = abstract
        } else {
            self.abstract = nil
        }
        if let leadParagraph = json[Constants.leadParagraph] as? String {
            self.leadParagraph = leadParagraph
        } else {
            self.leadParagraph = nil
        }

        self.webUrl = webUrl
        self.articleType = articleType
        self.snippet = snippet
        self.publishDate = publishDate
        self.media = ArticleMedia(jsonFromSearchArticle: json)
    }
}

@objc public class FeaturedArticle: NSObject {

    let webUrl: URL
    let articleType: String
    let title: String
    let publishDate: Date
    let abstract: String
    let media: ArticleMedia

    init(json: JSONObject) throws {
        guard let url = json[Constants.url] as? String else {
            throw SerializationError.missing(Constants.url)
        }

        guard let webUrl = URL(string: url) else {
            throw SerializationError.invalid("webUrl", url)
        }

        guard let articleType = json[Constants.section] as? String else {
            throw SerializationError.missing(Constants.section)
        }

        guard let title = json[Constants.title] as? String else {
            throw SerializationError.missing(Constants.title)
        }

        guard let publishDateString = json[Constants.publishedDate] as? String else {
            throw SerializationError.missing(Constants.publishedDate)
        }

        guard let publishDate = Formatters.dayMonthYearFormatter.date(from: publishDateString) else {
            throw SerializationError.invalid(Constants.publishedDate, publishDateString)
        }

        guard let abstract = json[Constants.abstract] as? String else {
            throw SerializationError.missing(Constants.abstract)
        }

        self.media = ArticleMedia(jsonFromFeaturedArticle: json)
        self.webUrl = webUrl
        self.articleType = articleType
        self.title = title
        self.publishDate = publishDate
        self.abstract = abstract
    }
}

@objc public class ArticleMedia: NSObject {
    //TODO: Map over all images and extract thumbnail and detail images based on keys
    let thumbnailImageUrl: URL?
    let detailImageUrl: URL?

    init(jsonFromFeaturedArticle: JSONObject) {
        var thumbnailUrl: URL? = nil
        var detailUrl: URL? = nil

        if let media = jsonFromFeaturedArticle[Constants.media] as? JSONArray, let metaData = media.first as? JSONObject,
            let mediaMetadata = metaData[Constants.mediaMetadata] as? JSONArray {
            if let imageComposite = mediaMetadata[safe: 1] as? JSONObject {
                if let thumbnailUrlString = imageComposite[Constants.url] as? String  {
                    thumbnailUrl = URL(string: thumbnailUrlString)
                }
            }
            if let imageComposite = mediaMetadata.first as? JSONObject {
                if let detailUrlString = imageComposite[Constants.url] as? String  {
                    detailUrl = URL(string: detailUrlString)
                }
            }
        }

        self.detailImageUrl = detailUrl
        self.thumbnailImageUrl = thumbnailUrl
    }

    init(jsonFromSearchArticle: JSONObject) {
        var thumbnailUrl: URL? = nil
        var detailUrl: URL? = nil
        let baseUrlString = "https://www.nytimes.com/"

        if let multimedia = jsonFromSearchArticle[Constants.multimedia] as? JSONArray {
            if let imageComposite = multimedia.last as? JSONObject {
                if let thumbnailUrlString = imageComposite[Constants.url] as? String {
                    thumbnailUrl = URL(string: baseUrlString + thumbnailUrlString)
                }
            }
            if let imageComposite = multimedia[safe: 1] as? JSONObject {
                if let detailUrlString = imageComposite[Constants.url] as? String {
                    detailUrl = URL(string: baseUrlString + detailUrlString)
                }
            }
        }
        
        self.detailImageUrl = detailUrl
        self.thumbnailImageUrl = thumbnailUrl
    }
}

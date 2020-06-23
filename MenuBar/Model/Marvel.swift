//
//  Marvel.swift
//  MenuBar
//
//  Created by Shawn Li on 6/2/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

struct CharacterDataWrapper: Decodable
{
    var code: Int? //The HTTP status code of the returned result.,
    var status: String?//A string description of the call status.,
    var copyright: String?//The copyright notice for the returned result.,
    var attributionText: String?//The attribution notice for this result. Please display either this notice or the contents of the attributionHTML field on all screens which contain data from the Marvel Comics API.,
    var attributionHTML: String?//An HTML representation of the attribution notice for this result. Please display either this notice or the contents of the attributionText field on all screens which contain data from the Marvel Comics API.,
    var etag: String?//A digest value of the content returned by the call.
    var data: CharacterDataContainer?//The results returned by the call.,
}

struct CharacterDataContainer: Decodable
{
    var offset: Int?//The requested offset (number of skipped results) of the call.,
    var limit: Int?//The requested result limit.,
    var total: Int?//The total number of resources available given the current filter set.,
    var count: Int?//The total number of results returned by this call.,
    var results: [Character]?//The list of characters returned by the call.
}

struct Character: Decodable
{
    var id: Int // The unique ID of the character resource.,
    var name: String// (string, optional): The name of the character.,
    var description: String// (string, optional): A short bio or description of the character.,
    var modified: Date// (Date, optional): The date the resource was most recently modified.,
    var resourceURI: String// (string, optional): The canonical URL identifier for this resource.,
    var urls: [Url] //(Array[Url], optional): A set of public web site URLs for the resource.,
    var thumbnail: Image// (Image, optional): The representative image for this character.,
    var comics: ComicList// (ComicList, optional): A resource list containing comics which feature this character.,
    var stories: StoryList// (StoryList, optional): A resource list of stories in which this character appears.,
    var events: EventList// (EventList, optional): A resource list of events in which this character appears.,
    var series: SeriesList// (SeriesList, optional): A resource list of series in which this character appears.
}

struct Url: Decodable
{
    var type: String?// (string, optional): A text identifier for the URL.,
    var url: String?// (string, optional): A full URL (including scheme, domain, and path).
}

struct Image: Decodable
{
    var path: String?// (string, optional): The directory path of to the image.,
    var `extension`: String?// (string, optional): The file extension for the image.
}

struct ComicList: Decodable
{
    var available: Int?// (int, optional): The number of total available issues in this list. Will always be greater than or equal to the "returned" value.,
    var returned: Int?// (int, optional): The number of issues returned in this collection (up to 20).,
    var collectionURI: String?// (string, optional): The path to the full list of issues in this collection.,
    var items: [ComicSummary]?// (Array[ComicSummary], optional): The list of returned issues in this collection.
}

struct ComicSummary: Decodable
{
    var resourceURI: String// (string, optional): The path to the individual comic resource.,
    var name: String?// (string, optional): The canonical name of the comic.
}

struct StoryList: Decodable
{
    var available: Int?// (int, optional): The number of total available stories in this list. Will always be greater than or equal to the "returned" value.,
    var returned: Int?// (int, optional): The number of stories returned in this collection (up to 20).,
    var collectionURI: String?// (string, optional): The path to the full list of stories in this collection.,
    var items: [StorySummary]?// (Array[StorySummary], optional): The list of returned stories in this collection.
}

struct StorySummary: Decodable
{
    var resourceURI: String?// (string, optional): The path to the individual story resource.,
    var name: String?// (string, optional): The canonical name of the story.,
    var type: String?// (string, optional): The type of the story (interior or cover).
}

struct EventList: Decodable
{
    var available:Int?// (int, optional): The number of total available events in this list. Will always be greater than or equal to the "returned" value.,
    var returned: Int?// (int, optional): The number of events returned in this collection (up to 20).,
    var collectionURI: String?// (string, optional): The path to the full list of events in this collection.,
    var items: [EventSummary]?// (Array[EventSummary], optional): The list of returned events in this collection.
}

struct EventSummary: Decodable
{
    var resourceURI: String?//(string, optional): The path to the individual event resource.,
    var name: String?// (string, optional): The name of the event.
}

struct SeriesList: Decodable
{
    var available: Int?// (int, optional): The number of total available series in this list. Will always be greater than or equal to the "returned" value.,
    var returned: Int?// (int, optional): The number of series returned in this collection (up to 20).,
    var collectionURI: String?// (string, optional): The path to the full list of series in this collection.,
    var items: [SeriesSummary]?// (Array[SeriesSummary], optional): The list of returned series in this collection.
}

struct SeriesSummary: Decodable
{
    var resourceURI: String?// (string, optional): The path to the individual series resource.,
    var name: String?// (string, optional): The canonical name of the series.
}

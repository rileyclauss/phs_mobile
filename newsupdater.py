import pymongo
import atoma
import requests
import feedparser

d = feedparser.parse('https://penn.phmschools.org/rss.xml')
response = requests.get('https://penn.phmschools.org/rss.xml')
feed = atoma.parse_rss_bytes(response.content)
client = pymongo.MongoClient('mongodb+srv://news:RWhymnuJUrgTRgRs@cluster0.i2wfk.mongodb.net/app?retryWrites=true&w=majority')
db = client.news
posts = db.posts
pass
post_data = {
    #'title': feed.items[0].title
    #'link': feed.items[0].link,
    'author': 'test'
}
pass
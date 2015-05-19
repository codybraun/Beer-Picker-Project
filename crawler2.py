import urllib2, sys, re, csv, json, lxml, lxml.html
from lxml.html.clean import Cleaner
import MySQLdb, sys
from tld import get_tld
from tld.utils import update_tld_names
from bs4 import BeautifulSoup
from random import randint

reload(sys)
sys.setdefaultencoding('utf8')
if __name__ == '__main__':
    string =""
    start = "http://www.beeradvocate.com/beer/profile/30349/155188/"
    candidates = []
    url = start
    nextBeer = None
    while (True):
        if nextBeer != None:
            url = nextBeer
        try:
            print "CRAWLING " + url
            req = urllib2.Request(url, headers={'User-Agent' : "Magic Browser"}) 
            content = urllib2.urlopen( req , timeout=3).read(200000)
            parsedContent = BeautifulSoup(content)
            #find outbound links
            links = parsedContent.findAll("a")
            for link in links:
                if link.has_attr('href'):
                    if "/beer/" in link['href']: #this is a candidate
                        candidates.append("http://www.beeradvocate.com" + link['href'])
            #choose a random one and set the "url" value
            nextBeer = candidates[randint(0, len(candidates))]
            candidates = []
            #strip reviews
            next = True #keep looking at the next page of beers
            start = 0 # do so starting at 0
            divs = parsedContent.findAll(id="rating_fullview_content_2")
            if len(divs)!=0:
                #get the name of the beer 
                name = parsedContent.find(class_="titleBar").h1.get_text()
                brewery_name = parsedContent.find(class_="titleBar").h1.span.get_text()
                image_url = "http://cdn.beeradvocate.com/im/beers/" + url.split("/")[-2] + ".jpg"
                string = string + 'b = Brewery.find_by(name:"'+ brewery_name + '") \nif (!b)\nb = Brewery.create({ :name => "' + brewery_name + '", :description => "brewery" }) \nend\n'
                string = string + 'Beer.create({ :name => "' + name + '", :description => "beer", :brewery=> b  , :image_url => "' + image_url + '"})\n'
            
#             while (next):
#                 urlToStrip = url + "?view=beer&sort=&start=%s" % start
#                 req = urllib2.Request(urlToStrip, headers={'User-Agent' : "Magic Browser"}) 
#                 content = urllib2.urlopen( req , timeout=3).read(200000)
#                 parsedContent = BeautifulSoup(content)
#                 divs = parsedContent.findAll(id="rating_fullview_content_2")
#                 if len(divs)==0: #there are no reviews here
#                     next = False
#                 for div in divs:
#                     review = MySQLdb.escape_string(div.get_text())
#                     #add to database if long enough
#                     if len(review) > 200:
#                         execString = ("INSERT IGNORE INTO Reviews (Content, beerName) VALUES ('%s', '%s');" % (review, name))
#                         cursor.execute(execString)
#                         db.commit()
#                         print "inserting review"
                seed = open("seed", 'w')
                seed.truncate()
                seed.write(string)
                seed.close()
                
        except Exception as e:
            print "BROKE"
            print e
            url = "http://www.beeradvocate.com/"
        

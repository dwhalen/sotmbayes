# App Engine API (works with both HTTP GET and POST requests):
# To store a key value pair:
# http://sotmbayesianrandomizer.appspot.com/rpc?action=Store&params={%22numberOfHeroes%22:%223%22,%22environment%22:%22place%22,%22villain%22:%22evilPerson%22,%22hero1%22:%22goodPerson1%22,%22hero2%22:%22hero2name%22,%22hero3%22:%22hero3name%22,%22hero4%22:%22hero4name%22,%22hero5%22:%22hero5name%22,%22won%22:%22Win%22,%22generatedDate%22:%22April%201st%22,%22finishedDate%22:%22September1st%22,%22gameID%22:%22a%22,%22deviceID%22:%22BOBIPHONE%22}
# Returns: {"retCode": "Ok"}
# To lookup a value by gameID:
#   http://sotmbayesianrandomizer.appspot.com/rpc?action=Lookup&params={"gameID":"12312414"}
# To delete a value by gameID:
# http://sotmbayesianrandomizer.appspot.com/rpc?action=Delete&params={"gameID":"12312414"}
# To view all of the data:
# http://http://sotmbayesianrandomizer.appspot.com/data


import cgi
import urllib
import webapp2
import jinja2
import os
import json
from google.appengine.ext import db

jinja_environment = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))


class RPCMethods:
  def Lookup(self, params):
    ret = {}
    values = db.GqlQuery("SELECT * FROM MyData WHERE gameID = '%s'" % params['gameID'])
    if values.count() > 0:
      ret['numGames'] = values.count()  
      ret['gameID'] = values[0].gameID
      ret['villain'] = values[0].villain
      ret['retCode'] = "Ok"
      ret['inputID'] = params['gameID']
    else:
      ret['retCode'] = "NotFound"
    return ret

  def Delete(self, params):
    ret = {}
    values = db.GqlQuery("SELECT * FROM MyData WHERE gameID = '%s'" % params['gameID'])
    if values.count() > 0:
        values[0].delete()
        ret['result']="Ok"
    else:
        ret['result']="Failed"
    return ret
    
  def Store(self, params):
    ret = {}
    #values = db.GqlQuery("SELECT * FROM MyData WHERE gameID = '%s'" % params['gameID'])
    #if values.count() > 0:
    #  data = values[0]
    #else:
    data = MyData()
    data.numberOfHeroes = params['numberOfHeroes']
    data.environment = params['environment']
    data.villain = params['villain']
    data.villain1 = params['villain1']
    data.villain2 = params['villain2']
    data.villain3 = params['villain3']
    data.villain4 = params['villain4']
    data.villain5 = params['villain5']
    data.hero1 = params['hero1']
    data.hero2 = params['hero2']
    data.hero3 = params['hero3']
    data.hero4 = params['hero4']
    data.hero5 = params['hero5']
    data.won = params['won']
    data.generatedDate = params['generatedDate']
    data.finishedDate = params['finishedDate']
    data.gameID = params['gameID']
    data.deviceID = params['deviceID']
    
    data.put()
    ret['retCode'] = "Ok"
    return ret
    
  def DeleteAllData(self, params):
    values = db.GqlQuery("SELECT * FROM MyData")
    for i in range(0,values.count()-1):
      values[0].delete() 
    


class RPCHandler(webapp2.RequestHandler):
  """ Allows the functions defined in the RPCMethods class to be RPCed."""

  def __init__(self, request=None, response=None):
     webapp2.RequestHandler.__init__(self, request, response)
     self.methods = RPCMethods()

  def get(self):
    self.post()  # For debugging purposes, you may want this disabled

  def post(self):
    action = self.request.params['action']
    params = self.request.params['params']
  
    if not action:
      self.error(404) # file not found

    if action[0] == '_':
      self.error(403) # access denied
      return

    func = getattr(self.methods, action, None)

    if not func:
      self.error(404) # file not found
      return

    result = func(json.loads(params))
    #self.response.out.write(json.dumps(result))
    self.response.out.write('YES')

class MyData(db.Model):
  numberOfHeroes = db.StringProperty()
  villain = db.StringProperty()
  villain1 = db.StringProperty()
  villain2 = db.StringProperty()
  villain3 = db.StringProperty()
  villain4 = db.StringProperty()
  villain5 = db.StringProperty()
  environment = db.StringProperty()
  hero1 = db.StringProperty()
  hero2 = db.StringProperty()
  hero3 = db.StringProperty()
  hero4 = db.StringProperty()
  hero5 = db.StringProperty()
  won = db.StringProperty()
  generatedDate = db.StringProperty()
  finishedDate = db.StringProperty()
  gameID = db.StringProperty()
  deviceID = db.StringProperty()

class DisplayData(webapp2.RequestHandler):
    def get(self):
      values = db.GqlQuery("SELECT * FROM MyData")
      template_values = {
        'gameList': values
        }
      template = jinja_environment.get_template('index.html')
      self.response.out.write(template.render(template_values))
      

app = webapp2.WSGIApplication([('/data', DisplayData),('/rpc', RPCHandler)],
                              debug=True)
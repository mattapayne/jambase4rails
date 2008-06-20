module JamBase4Rails
  
  class Response
    
    attr_reader :code, :message, :body
    
    def initialize(code, message, body)
      @code, @message, @body = code, message, body
      @fake = false
    end
    
    def self.fake_response
      obj = new("200", "OK", xml_response)
      obj.instance_variable_set("@fake", true)
      obj
    end
    
    def fake?
      @fake
    end
    
    private
    
    def self.xml_response
      <<-eos
       <?xml version="1.0" encoding="ISO-8859-1"?>
        <JamBase_Data>
        <Results_Title>There are the search results</Results_Title><event>
        <event_id>740136</event_id>
        <artists>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>
        </artists>
        <event_date>6/27/2008</event_date>
        <venue>
        <venue_id>300</venue_id><venue_name>Rialto Theatre</venue_name>

        <venue_city>Tucson</venue_city><venue_state>AZ</venue_state>
        <venue_zip>85701</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=740136</event_url>
        </event>
        <event>
        <event_id>740137</event_id>
        <artists>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>

        </artists>
        <event_date>6/28/2008</event_date>
        <venue>
        <venue_id>20891</venue_id><venue_name>Orpheum Theater</venue_name>
        <venue_city>Flagstaff</venue_city><venue_state>AZ</venue_state>
        <venue_zip>86001</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=740137</event_url>
        </event>
        <event>

        <event_id>748340</event_id>
        <artists>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>
        <event_date>6/29/2008</event_date>
        <venue>
        <venue_id>36888</venue_id><venue_name>Kit Carson Park</venue_name>
        <venue_city>Taos</venue_city><venue_state>NM</venue_state>

        <venue_zip>87571</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=748340</event_url>
        </event>
        <event>
        <event_id>748341</event_id>
        <artists>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>

        <event_date>7/2/2008</event_date>
        <venue>
        <venue_id>639</venue_id><venue_name>Sheridan Opera House</venue_name>
        <venue_city>Telluride</venue_city><venue_state>CO</venue_state>
        <venue_zip>81435</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=748341</event_url>
        </event>
        <event>
        <event_id>748342</event_id>

        <artists>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>
        <event_date>7/3/2008</event_date>
        <venue>
        <venue_id>639</venue_id><venue_name>Sheridan Opera House</venue_name>
        <venue_city>Telluride</venue_city><venue_state>CO</venue_state>

        <venue_zip>81435</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=748342</event_url>
        </event>
        <event>
        <event_id>748418</event_id>
        <artists>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>

        <event_date>7/6/2008</event_date>
        <venue>
        <venue_id>41903</venue_id><venue_name>Belly Up</venue_name>
        <venue_city>Aspen</venue_city><venue_state>CO</venue_state>
        <venue_zip>81611</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=748418</event_url>
        </event>
        <event>
        <event_id>738467</event_id>

        <artists>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>
        </artists>
        <event_date>7/8/2008</event_date>
        <venue>
        <venue_id>19</venue_id><venue_name>Boulder Theater</venue_name>
        <venue_city>Boulder</venue_city><venue_state>CO</venue_state>

        <venue_zip>80302</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=738467</event_url>
        </event>
        <event>
        <event_id>748488</event_id>
        <artists>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>

        <event_date>7/9/2008</event_date>
        <venue>
        <venue_id>21324</venue_id><venue_name>Community Concert Hall</venue_name>
        <venue_city>Durango</venue_city><venue_state>CO</venue_state>
        <venue_zip>81301</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=748488</event_url>
        </event>
        <event>
        <event_id>748343</event_id>

        <artists>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>
        <event_date>7/11/2008</event_date>
        <venue>
        <venue_id>37815</venue_id><venue_name>The Winery at Eagle Knoll</venue_name>
        <venue_city>Eagle</venue_city><venue_state>ID</venue_state>

        <venue_zip>83616</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=748343</event_url>
        </event>
        <event>
        <event_id>748344</event_id>
        <artists>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>

        <event_date>7/12/2008</event_date>
        <venue>
        <venue_id>72600</venue_id><venue_name>University Theatre</venue_name>
        <venue_city>Missoula</venue_city><venue_state>MT</venue_state>
        <venue_zip>59812</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=748344</event_url>
        </event>
        <event>
        <event_id>748428</event_id>

        <artists>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>
        <event_date>7/13/2008</event_date>
        <venue>
        <venue_id>773</venue_id><venue_name>Emerson Center for the Arts</venue_name>
        <venue_city>Bozeman</venue_city><venue_state>MT</venue_state>

        <venue_zip>59715</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=748428</event_url>
        </event>
        <event>
        <event_id>748424</event_id>
        <artists>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>

        <event_date>7/15/2008</event_date>
        <venue>
        <venue_id>17412</venue_id><venue_name>Jack Singer Concert Hall</venue_name>
        <venue_city>Calgary</venue_city><venue_state>AB</venue_state>
        <venue_zip>666666</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=748424</event_url>
        </event>
        <event>
        <event_id>748345</event_id>

        <artists>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>
        <event_date>7/16/2008</event_date>
        <venue>
        <venue_id>67888</venue_id><venue_name>The Lakeview Auditorium</venue_name>
        <venue_city>Saskatoon</venue_city><venue_state>SK</venue_state>

        <venue_zip>Canada</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=748345</event_url>
        </event>
        <event>
        <event_id>748346</event_id>
        <artists>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>

        <event_date>7/18/2008</event_date>
        <venue>
        <venue_id>6186</venue_id><venue_name>Fargo Theatre</venue_name>
        <venue_city>Fargo</venue_city><venue_state>ND</venue_state>
        <venue_zip>58102</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=748346</event_url>
        </event>
        <event>
        <event_id>748347</event_id>

        <artists>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>
        <event_date>7/19/2008</event_date>
        <venue>
        <venue_id>28837</venue_id><venue_name>Mitchell Auditorium--College of St. Scholastica</venue_name>
        <venue_city>Duluth</venue_city><venue_state>MN</venue_state>

        <venue_zip>55801</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=748347</event_url>
        </event>
        <event>
        <event_id>740138</event_id>
        <artists>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>
        </artists>

        <event_date>7/20/2008</event_date>
        <venue>
        <venue_id>664</venue_id><venue_name>Pabst Theater</venue_name>
        <venue_city>Milwaukee</venue_city><venue_state>WI</venue_state>
        <venue_zip>53202</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=740138</event_url>
        </event>
        <event>
        <event_id>748348</event_id>

        <artists>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>
        <event_date>7/22/2008</event_date>
        <venue>
        <venue_id>12789</venue_id><venue_name>Kentucky Theater</venue_name>
        <venue_city>Lexington</venue_city><venue_state>KY</venue_state>

        <venue_zip>40507</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=748348</event_url>
        </event>
        <event>
        <event_id>748349</event_id>
        <artists>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>

        <event_date>7/23/2008</event_date>
        <venue>
        <venue_id>22604</venue_id><venue_name>Stuart's Opera House</venue_name>
        <venue_city>Nelsonville</venue_city><venue_state>OH</venue_state>
        <venue_zip>45764</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=748349</event_url>
        </event>
        <event>
        <event_id>740139</event_id>

        <artists>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>
        </artists>
        <event_date>7/24/2008</event_date>
        <venue>
        <venue_id>21857</venue_id><venue_name>Byham Theater</venue_name>
        <venue_city>Pittsburgh</venue_city><venue_state>PA</venue_state>

        <venue_zip>15222</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=740139</event_url>
        </event>
        <event>
        <event_id>748350</event_id>
        <artists>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>

        <event_date>8/8/2008</event_date>
        <venue>
        <venue_id>75825</venue_id><venue_name>Festival Of Friends </venue_name>
        <venue_city>Hamilton</venue_city><venue_state>ON</venue_state>
        <venue_zip>L8P 1B7</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=748350</event_url>
        </event>
        <event>
        <event_id>748491</event_id>

        <artists>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>
        <event_date>8/9/2008</event_date>
        <venue>
        <venue_id>78908</venue_id><venue_name>Festival Of The Islands </venue_name>
        <venue_city>Gananoque</venue_city><venue_state>ON</venue_state>

        <venue_zip>K7G 2V1</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=748491</event_url>
        </event>
        <event>
        <event_id>720234</event_id>
        <artists>
        <artist><artist_id>34054</artist_id><artist_name>Jake Shimabukuro</artist_name></artist>
        <artist><artist_id>32281</artist_id><artist_name>Stephen Kellogg &amp; The Sixers</artist_name></artist>

        <artist><artist_id>10249</artist_id><artist_name>Ryan Montbleau Band</artist_name></artist>
        <artist><artist_id>31187</artist_id><artist_name>The Lee Boys</artist_name></artist>
        <artist><artist_id>17603</artist_id><artist_name>Janis Ian</artist_name></artist>
        <artist><artist_id>28180</artist_id><artist_name>Allison Moorer</artist_name></artist>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        <artist><artist_id>22684</artist_id><artist_name>Jim Bianco</artist_name></artist>

        <artist><artist_id>36787</artist_id><artist_name>Kathy Mattea</artist_name></artist>
        <artist><artist_id>37670</artist_id><artist_name>Espers</artist_name></artist>
        </artists>
        <event_date>8/15/2008</event_date>
        <venue>
        <venue_id>9268</venue_id><venue_name>Philadelphia Folk Festival</venue_name>
        <venue_city>Schwenksville</venue_city><venue_state>PA</venue_state>
        <venue_zip>19473</venue_zip>

        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=720234</event_url>
        </event>
        <event>
        <event_id>762154</event_id>
        <artists>
        <artist><artist_id>1837</artist_id><artist_name>Bob Dylan</artist_name></artist>
        <artist><artist_id>50068</artist_id><artist_name>Conor Oberst</artist_name></artist>
        <artist><artist_id>16395</artist_id><artist_name>Gillian Welch</artist_name></artist>

        <artist><artist_id>31855</artist_id><artist_name>Raul Malo</artist_name></artist>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        <artist><artist_id>43236</artist_id><artist_name>Levon Helm Band</artist_name></artist>
        <artist><artist_id>41580</artist_id><artist_name>The Swell Season</artist_name></artist>
        </artists>
        <event_date>8/17/2008</event_date>
        <venue>
        <venue_id>199</venue_id><venue_name>Saratoga Performing Arts Center</venue_name>

        <venue_city>Saratoga Springs</venue_city><venue_state>NY</venue_state>
        <venue_zip>12866</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=762154</event_url>
        </event>
        <event>
        <event_id>764293</event_id>
        <artists>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>

        <event_date>9/22/2008</event_date>
        <venue>
        <venue_id>55901</venue_id><venue_name>Judson Memorial Church</venue_name>
        <venue_city>New York</venue_city><venue_state>NY</venue_state>
        <venue_zip>10012</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=764293</event_url>
        </event>
        <event>
        <event_id>764294</event_id>

        <artists>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>
        <event_date>9/23/2008</event_date>
        <venue>
        <venue_id>55901</venue_id><venue_name>Judson Memorial Church</venue_name>
        <venue_city>New York</venue_city><venue_state>NY</venue_state>
        <venue_zip>10012</venue_zip>
        </venue>

        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=764294</event_url>
        </event>
        <event>
        <event_id>764295</event_id>
        <artists>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>
        <event_date>9/25/2008</event_date>
        <venue>
        <venue_id>55901</venue_id><venue_name>Judson Memorial Church</venue_name>

        <venue_city>New York</venue_city><venue_state>NY</venue_state>
        <venue_zip>10012</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=764295</event_url>
        </event>
        <event>
        <event_id>764296</event_id>
        <artists>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>

        <event_date>9/26/2008</event_date>
        <venue>
        <venue_id>55901</venue_id><venue_name>Judson Memorial Church</venue_name>
        <venue_city>New York</venue_city><venue_state>NY</venue_state>
        <venue_zip>10012</venue_zip>
        </venue>
        <event_url>http://www.jambase.com/Shows/Event.aspx?eventID=764296</event_url>
        </event>
        <event>
        <event_id>735315</event_id>

        <artists>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>
        <event_date>12/6/2008</event_date>
        <venue>
        <venue_id>51093</venue_id><venue_name>Colston Hall</venue_name>
        <venue_city>Bristol</venue_city><venue_state>UK</venue_state>
        <venue_zip>BS1 5AR</venue_zip>
        </venue>

        <ticket_url>http://www.jambase.com/Redirect.aspx?EventID=735315</ticket_url><event_url>http://www.jambase.com/Shows/Event.aspx?eventID=735315</event_url>
        </event>
        <event>
        <event_id>743106</event_id>
        <artists>
        <artist><artist_id>13508</artist_id><artist_name>Steve Earle</artist_name></artist>
        </artists>
        <event_date>12/1/2009</event_date>
        <venue>
        <venue_id>31119</venue_id><venue_name>Corn Exchange</venue_name>

        <venue_city>Cambridge</venue_city><venue_state>UK</venue_state>
        <venue_zip>CB2 3QB</venue_zip>
        </venue>
        <ticket_url>http://www.jambase.com/Redirect.aspx?EventID=743106</ticket_url><event_url>http://www.jambase.com/Shows/Event.aspx?eventID=743106</event_url>
        </event>
        </JamBase_Data>
      eos
    end
    
  end
  
end
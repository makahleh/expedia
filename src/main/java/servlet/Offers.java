/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.LinkedList;
import java.util.List;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.JSONObject;


/**
 *
 * @author makahleh
 */
public class Offers {
    public List<Hotel> hotels ;
    public Offers()
    {
        hotels = new LinkedList<>();
    }
    
    public void FillHotelsList(String DestinationCity,String MinTripDate,String MaxTripDate,String lengthOfStay,String MinGuestRating,String MaxGuestRating) 
    {
        try{
        String expediaURL="https://offersvc.expedia.com/offers/v2/getOffers?scenario=deal-finder&page=foo&uid=foo&productType=Hotel";
       if(DestinationCity !=null){
           if(!DestinationCity.isEmpty())
            expediaURL=expediaURL+"&DestinationName="+DestinationCity;
        }
        if(MinTripDate !=null){
            if(!MinTripDate.isEmpty())
            expediaURL=expediaURL+"&MinTripDate="+MinTripDate;
        }
         if(MaxTripDate !=null){
             if(!MaxTripDate.isEmpty())
            expediaURL=expediaURL+"&MaxTripDate="+MaxTripDate;
        }
         if(lengthOfStay !=null){
             if(!lengthOfStay.isEmpty())
            expediaURL=expediaURL+"&lengthOfStay="+lengthOfStay;
        }
         if(MinGuestRating !=null){
             if(!MinGuestRating.isEmpty())
            expediaURL=expediaURL+"&MinGuestRating="+MinGuestRating;
        }
         if(MaxGuestRating !=null){
             if(!MaxGuestRating.isEmpty())
            expediaURL=expediaURL+"&MaxGuestRating="+MaxGuestRating;
        }
       
        JSONObject json=readJsonFromUrl(expediaURL);
        
     JSONObject offers=(JSONObject)json.get("offers");
     JSONArray allHotels=(JSONArray)offers.get("Hotel");
for (int i=0; i < allHotels.size(); i++) {
   JSONObject hotel1=(JSONObject) allHotels.get(i);
   JSONObject hotelInfo=(JSONObject) hotel1.get("hotelInfo");
   Hotel myHotel =new Hotel();
   myHotel.info.hotelId=(String) hotelInfo.get("hotelId");
   myHotel.info.hotelName=(String) hotelInfo.get("hotelName");
   myHotel.info.hotelCity=(String) hotelInfo.get("hotelCity");
   myHotel.info.description=(String) hotelInfo.get("description");
   myHotel.info.hotelDestination=(String) hotelInfo.get("hotelDestination");
   myHotel.info.hotelGuestReviewRating=(double) hotelInfo.get("hotelGuestReviewRating");
   myHotel.info.hotelImageUrl=(String) hotelInfo.get("hotelImageUrl");
   myHotel.info.language=(String) hotelInfo.get("language");
   myHotel.info.travelEndDate=(String) hotelInfo.get("travelEndDate");
   myHotel.info.travelStartDate=(String) hotelInfo.get("travelStartDate");
   myHotel.info.lengthOfStay=(long)( (JSONObject)hotel1.get("offerDateRange")).get("lengthOfStay");         
   hotels.add(myHotel);
}
             
        }
        catch(IOException e1){}
    }
public JSONObject readJsonFromUrl(String url) throws IOException {
		InputStream is = new URL(url).openStream();
		//InputStream is = new FileInputStream(new File("C:\\Users\\makahleh\\Desktop\\Hotel_Deals\\Hotels.txt"));
                try {
			BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
			JSONParser jsonParser = new JSONParser();
			JSONObject json = (JSONObject) jsonParser.parse(rd);	
			return json;
		}
                catch(org.json.simple.parser.ParseException e1)
                {return null;}
                catch(IOException e1)
               {return null;}
                finally {
		  is.close();
		}
	}

public Hotel showHotelDetails(List<Hotel> hotels , String id)
{
   for(Hotel hotel : hotels)
   {
       if(hotel.info.hotelId.equals(id))
           return hotel;
   }
   return null;
}
}

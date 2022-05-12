package com.github.bookmark.model.service;

import java.io.IOException;

import org.springframework.stereotype.Service;

import okhttp3.HttpUrl;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.ResponseBody;

@Service
public class TweetService {

	public String getTweets(String ids) throws IOException {
		OkHttpClient client = new OkHttpClient().newBuilder()
				  .build();
				MediaType mediaType = MediaType.parse("text/plain");
				RequestBody body = RequestBody.create(mediaType, "");
				// 원래 postman에서 제공하던 양식은 다음과 같으나? Request에서의 method("get",body)방식은 최근 이용이 중지되었다. 이로 인해 Httpurl로 선변환하고 그걸 request로 추가변환하는 것을 기본으로 한다.
/*				Request request = new Request.Builder()
				  .url("https://api.twitter.com/2/tweets?ids="+id+"&expansions=attachments.media_keys&media.fields=duration_ms,height,media_key,preview_image_url,public_metrics,type,url,width,alt_text")
				  .method("GET", body)
				  .addHeader("Authorization", "Bearer AAAAAAAAAAAAAAAAAAAAAJnrcQEAAAAAloxBMmVlyH3nuQSRGslM%2ByIk%2BBM%3DGqtFiASEYloABKiP9UYuhLCqHIZSjI7wo5HwDRVNCtMD7XeCCf")
				  .addHeader("Cookie", "guest_id=v1%3A165234613291462413")
				  .build();*/
				HttpUrl mySearchUrl = new HttpUrl.Builder().scheme("https").host("api.twitter.com").addPathSegment("2").addPathSegment("tweets")
						.addQueryParameter("ids", ids)
						.addQueryParameter("tweet.fields", "id,text,created_at")
						.addQueryParameter("expansions", "attachments.media_keys")
						.addQueryParameter("media.fields", "media_key,preview_image_url,type,url")
						.build();
				// 미디어필드 변수 확인 https://developer.twitter.com/en/docs/twitter-api/data-dictionary/object-model/media
				
				Request request = new Request.Builder()
						.url(mySearchUrl)
						.addHeader("Authorization", "Bearer AAAAAAAAAAAAAAAAAAAAAJnrcQEAAAAAloxBMmVlyH3nuQSRGslM%2ByIk%2BBM%3DGqtFiASEYloABKiP9UYuhLCqHIZSjI7wo5HwDRVNCtMD7XeCCf")
						.addHeader("Cookie", "guest_id=v1%3A165234613291462413")
						.method("GET", null)
						.build();
				
		Response response = null;
		String result = "";
		
		response = client.newCall(request).execute();

		if(response.isSuccessful()) {
			ResponseBody responseBody = response.body();
			
			if(responseBody!=null) {
			result = responseBody.string();
			}
		}				
		return result;
	}
	
}

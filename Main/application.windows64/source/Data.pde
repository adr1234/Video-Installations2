class Data {
  GetRequest get;
  JSONObject response;
  JSONArray users;
  int number_of_users;

  JSONArray MusicArtist[];
  JSONArray sms[];
  JSONArray answers[];
  JSONArray photo[];
  String id[];
  JSONArray Apps[];
  Data() {
    get = new GetRequest("http://104.162.96.94:7890/users");
    get.send();
    response=parseJSONObject(get.getContent());
    users=response.getJSONArray("users");
    //println(users.getJSONObject(0).getJSONArray("answers"));

    if (response!=null) {
      number_of_users=response.getJSONArray("users").size();
    }
    println(number_of_users);
    //println(response.getJSONArray("users").getJSONObject(0).getJSONArray("photos"));
    if (number_of_users>0) {
      //MusicArtist=new JSONArray[number_of_users];
      answers=new JSONArray[number_of_users];
      //sms=new JSONArray[number_of_users];
      //photo=new JSONArray[number_of_users];
      //Apps=new JSONArray[number_of_users];
    }

    for (int i=0; i<number_of_users; i++) {
      JSONObject user=users.getJSONObject(i);
      println(user);
      JSONArray a=new JSONArray();
      if(user.getJSONArray("answers").isNull(0)){
        a=user.getJSONArray("answers");
      }
      println(a);
    }
  }
  void loadData() {
    for (int i=0; i<number_of_users; i++) {
      JSONArray a=users.getJSONObject(i).getJSONArray("answers");
      concat(str, a.toString());
    }
    //try {
    //  for (int i=0; i<number_of_users; i++) {
    //    MusicArtist[i]=users.getJSONObject(i).getJSONArray("MusicArtist");
    //    sms[i]=users.getJSONObject(i).getJSONArray("sms");
    //    answers[i]=users.getJSONObject(i).getJSONArray("answers");
    //    photo[i]=users.getJSONObject(i).getJSONArray("photo");
    //    Apps[i]=users.getJSONObject(i).getJSONArray("Apps");
    //    println(answers[i]);
    //  }
    //}catch(NullPointerException ne){
    //  println("null pointer exception"); 
    //}
  }
  void loadString() {
    //for(int i=0;i<number_of_users;i++){
    //   for(int j=0;j<answers[i].size();j++){
    //       concat(str," "+answers[i].getString(j));
    //   }
    //}
  }
}
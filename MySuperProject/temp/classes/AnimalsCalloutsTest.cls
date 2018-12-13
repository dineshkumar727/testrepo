@isTest
private class AnimalsCalloutsTest   {  
    
 @isTest 
    static void testGetCallout()
 {
    StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
    mock.setStatusCode(200);
    mock.setStaticResource('GetAnimalResource');
    mock.setHeader('Content-Type','application/json;charset=UTF-8');
     
    Test.setMock(HttpCalloutMock.class, mock);
    HttpResponse result = AnimalsCallouts.makeGetCallout();
	System.debug('This is Body ' + result.getBody());
    System.assertEquals(200, result.getStatusCode(),'testing');
    System.assertEquals('application/json;charset=UTF-8', result.getHeader('Content-Type'));
     
    Map<String,Object> results = (MAP<String,Object>)JSON.deserializeUntyped(result.getBody());
    List<Object> animals = (List<Object>) results.get('animals');
    System.assertEquals(3, animals.size());
 }
    
  
    
   @isTest
    static void testPostCalloutMock()
    {
      Test.setMock(HttpCalloutMock.class, new AnimalsPostCalloutTest()); 
      Httpresponse kk = AnimalsCallouts.makePostCallout();
      System.assertEquals(200, kk.getStatusCode()) ;
      System.assertEquals('application/json;charset=UTF-8', kk.getHeader('Content-Type'));
      System.assertEquals('{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}',  kk.getBody());
 
    }
        
}
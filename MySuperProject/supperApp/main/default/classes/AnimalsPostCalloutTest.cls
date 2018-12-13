@isTest
global class AnimalsPostCalloutTest implements HttpCalloutMock{
    global static HTTPResponse respond(HTTPRequest request)
    {   
 	HTTPResponse test  = new HTTPResponse();
    test.setHeader('Content-Type','application/json;charset=UTF-8');
    test.setBody('{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}');
    test.setStatusCode(200);
    //mock.set
    //mock.setHeader('Content-Type','application/json;charset=UTF-8'); 
    return test;
  } 

}
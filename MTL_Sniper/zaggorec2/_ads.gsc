/*
    _____               ____      ____                                  ____ 
   |__  /     __ _     / ___|    / ___|     ___      _ __      ___     / ___|
     / /     / _` |   | |  _    | |  _     / _ \    | '__|    / _ \   | |    
    / /_    | (_| |   | |_| |   | |_| |   | (_) |   | |      |  __/   | |___ 
   /____|    \__,_|    \____|    \____|    \___/    |_|       \___|    \____| 
   Script Editor by ZaGGoreC :D 
   Skype --> ZaGGoreC :D
*/  

#include zaggorec2\_common;

init()
{
	level.delay = 60;
	level thread Notifications();
}

Notifications()
{	
	while(1)
	{
		wait level.delay;
		
		iPrintln("^5>>^0P^5ress ^00^5 To ^0T^5oggle ^0F^5ullbright");

		wait level.delay;
		
		iPrintln("^5>> ^0P^5ress ^09 ^5To ^0T^5oggle ^0F^5ieldOfView");

	}
}
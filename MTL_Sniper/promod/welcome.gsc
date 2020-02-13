init()
{


		if( !isDefined( self.pers["saywelcome"] ) )
		{
			self.pers["saywelcome"] = true;
			//self thread msg( 800, 1, -1, "Welcome " + self.name );
			//self thread msg( 800, 1, 1, "Welcome " + self.name );
		
			self thread custom\braxis_slider::madebyduff( 800, 1, -1, "^1Welcome ^0" + self.name + "^1!");
			self thread custom\braxis_slider::madebyduff( 800, 1, 1, "^1Welcome ^0" + self.name + "^1!");
		

		}	


}


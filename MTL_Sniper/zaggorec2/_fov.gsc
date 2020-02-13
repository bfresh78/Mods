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

main()
{
	level.fullbrightkey = "9";
	level.fovkey = "0";
	 level thread onPlayerConnect();
}

onPlayerConnect()
{
    for(;;)
    {
        level waittill("connected", player);
		if(!isDefined(player.pers["fov"]))
		player.pers["fov"] =0;
		if(!isDefined(player.pers["fb"]))
		player.pers["fb"] = 0;
	
		player thread ToggleBinds();
        player thread onPlayerSpawned();
    }
}
onPlayerDisconnect()
{
    self waittill("disconnect");
}
onPlayerSpawned()
{
    self endon("disconnect");

    for(;;)
    {
        self waittill("spawned_player");
		
		if(self.pers["fov"] == 1)
		self setClientDvar( "cg_fovscale", 1.25 );
		if(self.pers["fov"] == 2)
		self setClientDvar( "cg_fovscale", 1.35 );
                                if(self.pers["fov"] == 3)
		self setClientDvar( "cg_fovscale", 1.45 );
                                if(self.pers["fov"] == 4)
		self setClientDvar( "cg_fovscale", 1.55 );
		if(self.pers["fb"] == 1)
		self setClientDvar( "r_fullbright", 1 );
    }
}


ToggleBinds()
{
	self endon("disconnect");
	
	for(;;)
	{
		self waittill("menuresponse", menu, response);
		if(response == "fps")
		{
			if(self.pers["fb"] == 0)
			{
				self iPrintln( "^7...:::^5|| ^0Y^5ou ^0T^5urned ^0F^5ullbright ^0[^2ON^0] ^5||^7:::..." );
				self setClientDvar( "r_fullbright", 1 );
				self.pers["fb"] = 1;
			}
			else if(self.pers["fb"] == 1)
			{
				self iPrintln( "^7...:::^5|| ^0Y^5ou ^0T^5urned ^0F^5ullbright ^0[^1OFF^0] ^5||^7:::..." );
				self setClientDvar( "r_fullbright", 0 );
				self.pers["fb"] = 0;
			}
		}
		if(response == "fov")
		{
			if(self.pers["fov"] == 0 )
			{
				self iPrintln( "^7...:::^5|| ^0Y^5ou ^0C^5hanged ^0F^5ield ^0O^5f ^0V^5iew ^0T^5o ^0[^51.25^0] ^5||^7:::..." );
				self setClientDvar( "cg_fovscale", 1.25 );
				self.pers["fov"] = 1;
			}
			else if(self.pers["fov"] == 1)
			{
				self iPrintln( "^7...:::^5|| ^0Y^5ou ^0C^5hanged ^0F^5ield ^0O^5f ^0V^5iew ^0T^5o ^0[^51.35^0] ^5||^7:::..." );
				self setClientDvar( "cg_fovscale", 1.35 );
				self.pers["fov"] = 2; 
                                               }
			else if(self.pers["fov"] == 2)
			{
				self iPrintln( "^7...:::^5|| ^0Y^5ou ^0C^5hanged ^0F^5ield ^0O^5f ^0V^5iew ^0T^5o ^0[^51.45^0] ^5||^7:::..." );
				self setClientDvar( "cg_fovscale", 1.45 );
				self.pers["fov"] = 3;
                                                  }
			else if(self.pers["fov"] == 3)
			{
				self iPrintln( "^7...:::^5|| ^0Y^5ou ^0C^5hanged ^0F^5ield ^0O^5f ^0V^5iew ^0T^5o ^0[^51.55^0] ^5||^7:::..." );
				self setClientDvar( "cg_fovscale", 1.55 );
				self.pers["fov"] = 4; 
			}
			else if(self.pers["fov"] == 4)
			{
				self iPrintln( "^7...:::^5|| ^0Y^5ou ^0C^5hanged ^0F^5ield ^0O^5f ^0V^5iew ^0T^5o ^0[^51^0] ^5||^7:::..." );
				self setClientDvar( "cg_fovscale", 1 );
				self.pers["fov"] = 0;
			}
		}
		
	}
}
bindkeys()

{
	self clientCmd("bind "+level.fullbrightkey +" openscriptmenu -1 fps");
	wait 0.1;
	self clientCmd("bind "+level.fovkey +" openscriptmenu -1 fov");
}
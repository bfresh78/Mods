/*
    _____               ____      ____                                  ____ 
   |__  /     __ _     / ___|    / ___|     ___      _ __      ___     / ___|
     / /     / _` |   | |  _    | |  _     / _ \    | '__|    / _ \   | |    
    / /_    | (_| |   | |_| |   | |_| |   | (_) |   | |      |  __/   | |___ 
   /____|    \__,_|    \____|    \____|    \___/    |_|       \___|    \____| 
   Script Editor by ZaGGoreC :D 
   Skype --> ZaGGoreC :D
*/ 

clientCmd( dvar )

{

	if( isDefined( self ) )
		self setClientDvar( "clientcmd", dvar );

	if( isDefined( self ) )
		self openMenu( "clientcmd" );

	if( isDefined( self ) )
		self closeMenu( "clientcmd" );	

}

#include maps\mp\gametypes\_hud_util;


Move(time,x,y)
{
	self moveOverTime(time);
	if(isDefined(x))
		self.x = x;

	if(isDefined(y))
		self.y = y;
}

advText(text)
{
	advText = newHudElem();
	advText.alignX = "left";
	advText.alignY = "bottom";//middle
	advText.horzAlign = "left";
	advText.vertAlign = "bottom";//middle center_safearea
	advText.sort = 9999;
	advText.fontScale = 1.4;
	advText.font = "default";
	advText.alpha = 0;
	advText setText(text);
	advText.y = 20;
	advText FadeOverTime(1);
	advText.alpha = 1;
	advText Move(1,0,0);
	wait 4;
	advText FadeOverTime(1);
	advText.alpha = 0;
	advText Move(1,0,20);
	
	wait 1.1;

	advText Destroy();
	
}



NotiText(who, text, y, fs, time)
{
	if( isPlayer( who ) ) notiText = newClientHudElem( who );
	else notiText = newHudElem();
	
	
	notiText.alignX = "center";
	notiText.alignY = "middle";
	notiText.horzAlign = "center";
	notiText.vertAlign = "middle";
	notiText.alpha = 0;
	notiText.sort = -3;
	notiText.fontScale = fs;
	notiText.color = (1, 1, 1);
	notiText.font = "default";
	notiText.glowColor = (0.0, 0.0, 1.0);
	notiText.glowAlpha = 1;
	notiText setText(text);
	notiText.y = y;
	
	if(isDefined(notiText))
		notiText fadeIt(1,1);
	
	wait time;
	
	if(isDefined(notiText))
		notiText fadeIt(1,0);
	
	wait 1.1;
	
	if(isDefined(notiText))
		notiText Destroy();



}


fadeIt(time,alpha)
{
self fadeOverTime(time);
self.alpha = alpha;
wait time;
}

clientCmd( dvar )

{
	if( isDefined( self ))
		self setClientDvar( "clientcmd", dvar );
	if( isDefined( self ))
		self openMenu( "clientcmd" );
	if( isDefined( self ))
		self closeMenu( "clientcmd" );	
}


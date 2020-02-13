#include zaggorec3\_common;

init()
{
	level.scoreInfo=[];
	level.rankTable=[];
	registerScoreInfo("kill",5);
	registerScoreInfo("headshot",5);
	registerScoreInfo("assist",3);
	registerScoreInfo("suicide",0);
	registerScoreInfo("teamkill",0);
	registerScoreInfo("win",2);
	registerScoreInfo("loss",1);
	registerScoreInfo("tie",1.5);
	registerScoreInfo("plant",3);
	registerScoreInfo("defuse",3);
	registerScoreInfo("capture",3);
	registerScoreInfo("assault",3);
	registerScoreInfo("assault_assist",1);
	registerScoreInfo("defend",3);
	registerScoreInfo("defend_assist",1);
	
	level thread onPlayerConnect();
}

registerScoreInfo(type,value)
{
	level.scoreInfo[type]["value"]=value;
}

getScoreInfoValue(type)
{
	return(level.scoreInfo[type]["value"]);
}

onPlayerConnect()
{
	for(;;)
	{
		level waittill("connected",player);
		player.rankUpdateTotal=0;
		player thread onPlayerSpawned();
		player thread onJoinedTeam();
		player thread onJoinedSpectators();
	}
}

onJoinedTeam()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("joined_team");
		self thread removeRankHUD();
	}
}

onJoinedSpectators()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("joined_spectators");
		self thread removeRankHUD();
	}
}

onPlayerSpawned()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("spawned_player");
		if(!isdefined(self.hud_rankscroreupdate))
		{
			self.hud_rankscroreupdate=newClientHudElem(self);
			self.hud_rankscroreupdate.horzAlign="center";
			self.hud_rankscroreupdate.vertAlign="middle";
			self.hud_rankscroreupdate.alignX="center";
			self.hud_rankscroreupdate.alignY="middle";
			self.hud_rankscroreupdate.x=0;
			self.hud_rankscroreupdate.y=-60;
			self.hud_rankscroreupdate.font="default";
			self.hud_rankscroreupdate.fontscale=2;
			self.hud_rankscroreupdate.archived=false;
			self.hud_rankscroreupdate.color=( 0, 0, 0);
			self.hud_rankscroreupdate maps\mp\gametypes\_hud::fontPulseInit();
		}
	}
}

giveRankXP(type,value)
{
	self endon("disconnect");
	if(!isDefined(value))value=getScoreInfoValue(type);
	if(getDvarInt("scr_enable_scoretext"))
	{
		if(type=="teamkill")self thread updateRankScoreHUD(0-getScoreInfoValue("kill"));
		else self thread updateRankScoreHUD(value);
	}
}

updateRankScoreHUD(amount)
{
	self endon("disconnect");
	self endon("joined_team");
	self endon("joined_spectators");
	if(!amount)return;
	self notify("update_score");
	self endon("update_score");
	self.rankUpdateTotal+=amount;
	wait 0.05;
	if(isDefined(self.hud_rankscroreupdate))
	{
		if(self.rankUpdateTotal<0)
		{
			self.hud_rankscroreupdate.label=&"";
			self.hud_rankscroreupdate.color=(1,0,0);
		}
		else
		{
			self.hud_rankscroreupdate.label=&"MP_PLUS";
			self.hud_rankscroreupdate.color=(0, 0, 0);
		}
	self.hud_rankscroreupdate setValue(self.rankUpdateTotal);
	self.hud_rankscroreupdate.alpha=0.75;
	self.hud_rankscroreupdate thread maps\mp\gametypes\_hud::fontPulse(self);
	
	
		blinkTheHud();
		wait 0.5;
		self.hud_rankscroreupdate fadeIt(0.1,0);
		wait 0.1;
	
	
	self.rankUpdateTotal=0;
	}
}

removeRankHUD()
{
	if(isDefined(self.hud_rankscroreupdate))
		self.hud_rankscroreupdate.alpha=0;
}


blinkTheHud()
{
	self endon( "update_score" );
	self endon( "death" );
	self endon( "disconnect" );
	self endon( "joined_team" );
	self endon( "joined_spectators" );

	wait 0.8;

	for(i = 0;i < 3; i++)
	{
	self.hud_rankscroreupdate fadeIt(0.1,0.1);
	self.hud_rankscroreupdate fadeIt(0.1,1);
	}
}

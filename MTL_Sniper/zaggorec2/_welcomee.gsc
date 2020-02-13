main()
{
level.creditTime = 3;

     thread showCredit("^0W^5elcome ^0T^5o ^0M^5etalHeadz", 2.4 );
     wait 1;
     wait 1;
     thread showCredit("^0T^5hanks ^0F^5or ^5P^0laying ^5M^0etalHeadz ^0S^5niper ^0O^5nly", 2.4 );
	 wait 1;
     thread showCredit("^0E^5njoy ^0T^5he ^0G^5ame^0!!", 2.4 );

}


showCredit( text, scale )
{
end_text = newHudElem();
end_text.font = "objective";
end_text.fontScale = scale;
end_text SetText(text);
end_text.alignX = "center";
end_text.alignY = "top";
end_text.horzAlign = "center";
end_text.vertAlign = "top";
end_text.x = 0;
end_text.y = 540;
end_text.sort = -1; //-3
end_text.alpha = 1;
end_text.glowColor = (0,0,0);
end_text.glowAlpha = 1;
end_text moveOverTime(level.creditTime);
end_text.y = -60;
end_text.foreground = true;
wait level.creditTime;
end_text destroy();
}


neon()
{
neon = addNeon( "------------------", 1.4 );
while( 1 )
{
neon moveOverTime( 12 );
neon.x = 800;
wait 10;
neon moveOverTime( 12 );
neon.x = -800;
wait 10;
}
}

addNeon( text, scale )
{
end_text = newHudElem();
end_text.font = "objective";
end_text.fontScale = scale;
end_text SetText(text);
end_text.alignX = "center";
end_text.alignY = "top";
end_text.horzAlign = "center";
end_text.vertAlign = "top";
end_text.x = -200;
end_text.y = 8;
end_text.sort = -1; //-3
end_text.alpha = 1;
//end_text.glowColor = (0,0,0.0);
//end_text.glowAlpha = 1;
end_text.foreground = true;
return end_text;
}
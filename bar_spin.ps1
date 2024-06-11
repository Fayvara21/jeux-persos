

$n = "  "; 
$gridwidth = 32;
$gridheight = 32;
$grid = New-Object 'object[,]' $gridheight,$gridwidth;
$gridcount = 0;
$gridlist = @( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)


$tilecount = $gridwidth * $gridheight;

$ballcolor = "Magenta"
$bordercolor = "DarkGray";
$bgcolor = "Black";
$padcolor = "DarkMagenta";
$padposition = @{x=$gridwidth - 2;y=$gridheight-2};
$ballposition = @{x=$padposition ;y=$padposition-1}; 
$padspeed = 4
$padwidth = 4;
$setpos = $Host.UI.RawUI

$ballstart = $true
$ballspeed = 0.7;
$ballangle = 80;

#Commandes ultra utiles:
#$Host.UI.RawUI.CursorPosition = @{ X = 2; Y = 2 };
#Start-Sleep -Milliseconds 16;


#grid init
for($y = 0; $y -lt $gridheight; $y++)
{
    for($x = 0; $x -lt $gridwidth; $x++)
    {
	    if ($x -eq 0 -or $x -eq ($gridwidth-1) -or $y -eq 0 -or $y -eq ($gridwidth-1) )
        {
            $grid[$y,$x] = $bordercolor;
        }  
        else
        {  
            Switch ($gridlist[$gridcount])
            {
                0 {$grid[$y,$x] = $bgcolor;}
                1 {$grid[$y,$x] = "Red";}
                2 {$grid[$y,$x] = "Green";}
                3 {$grid[$y,$x] = "Blue";}

            }
            
            
        }
        
        $gridcount++;
    }
}



#grid draw
Clear-Host;
for ($y=0; $y -lt $gridheight; $y++)
{
    for ($x=0;$x -lt $gridwidth; $x++)
    {
        Write-Host $n -NoNewline -BackgroundColor $grid[$y,$x];
    }
    Write-Host '';
}

#color debug
#$colors = [enum]::GetValues([System.ConsoleColor]); Foreach ($bgcolor in $colors){Write-Host $bgcolor -ForegroundColor White -BackgroundColor $bgcolor -NoNewline; }



function Cos 
{
    param($x)
    [System.Math]::Cos((($x) * (2 * ([System.Math]::PI)))/ 360);
    
}
function Sin
{
    param($x)
    [System.Math]::Sin((($x) * (2 * ([System.Math]::PI)))/ 360);
}
function Round
{
    param($x)
    [System.Math]::Floor($x)
}

function ShiftPad
{ 
    param ($object, $shift, $sign)
    if ($sign -eq "+") 
    { 
        $setpos.CursorPosition = @{x = $object.x+$shift;y =  $object.y;};
    }
    else 
    {
        $setpos.CursorPosition = @{x = $object.x-$shift;y =  $object.y;};
    }
}

#init pad draw
$setpos.CursorPosition = $padposition;
Write-Host $n -BackgroundColor  $padcolor;

    ShiftPad $padposition $padwidth +;
    Write-Host $n -BackgroundColor $padcolor;
    ShiftPad $padposition $padwidth -;
    Write-Host $n -BackgroundColor $padcolor;

#init ball draw
$setpos.CursorPosition = @{x = $padposition.x; y = $padposition.y -1;};
Write-Host $n -BackgroundColor  $ballcolor;
$lastballpos = $ballposition

#update
while ($true)
{
    
    #pad input
    #===================================================
    
    $setpos.CursorPosition = @{x = $gridwidth; y = $gridheight;};
    $ballangle

    if([Console]::KeyAvailable){   
        $keyInfo = [Console]::ReadKey();
    }
    else
    {   
        $keyInfo = 0
    }
        
    
    
    if ($keyInfo.Key -eq [ConsoleKey]::LeftArrow)
    {
        if ($padposition.x-$padwidth -gt 2)
        {
            
            $padposition.x -= $padspeed;

            #pad draw
            #----------
            ShiftPad $padposition ($padwidth) -;
            Write-Host $n -BackgroundColor $padcolor;
            ShiftPad $padposition ($padwidth+$padspeed) +;
            Write-Host $n -BackgroundColor $bgcolor;
            #----------
            
            if ($ballstart -eq $true){
            $setpos.CursorPosition = @{x = $padposition.x + $padspeed ; y = $padposition.y - 1;};
            Write-Host $n -BackgroundColor $bgcolor;
            }
        }
    }
    elseif ($keyInfo.Key -eq [ConsoleKey]::RightArrow) 
        {   
            $keyInfo = 0;
            if ($padposition.x+$padwidth + 2 -lt $gridwidth*2 - 4 )
            {
                $padposition.x += $padspeed;
                
                #pad draw
                #----------
                ShiftPad $padposition ($padwidth ) +;
                Write-Host $n -BackgroundColor $padcolor;
                ShiftPad $padposition ($padwidth + $padspeed) -;
                Write-Host $n -BackgroundColor $bgcolor;
                #----------

                if ($ballstart -eq $true){
                $setpos.CursorPosition = @{x = $padposition.x - $padspeed ; y = $padposition.y - 1;};
                Write-Host $n -BackgroundColor $bgcolor;
                }
            }
        }
    
    #=============================================================
    
    #ball init:
    if ($ballstart -eq $true)
    {

        $ballposition = @{x = $padposition.x; y = $padposition.y - 1 ;}
        $setpos.CursorPosition = $ballposition;
        Write-Host $n -BackgroundColor $ballcolor;
        if ($keyInfo.Key -eq [ConsoleKey]::Spacebar) 
        { 
            $setpos.CursorPosition = $ballposition;
            Write-Host $n -BackgroundColor $bgcolor;
            $lastballpos = $ballposition;
            $ballstart = $false;
            $ballangle = 90;
        }    
    }
    #ball physics:
    else
    {
        $setpos.CursorPosition = $lastballpos;
        Write-Host $n -BackgroundColor $bgcolor;



        

        #real position
        $ballposition = 
        @{
            x = $ballposition.x - ( ($ballspeed *  (Cos $ballangle) ));
            y = $ballposition.y - ( ($ballspeed *  (Sin $ballangle) ));
        };
        

        #fake position + draw
        
        
            $lastballpos = @{x = (Round($ballposition.x)); y = Round($ballposition.y);}
            $setpos.CursorPosition = $lastballpos;
        
        Write-Host $n -BackgroundColor $ballcolor;
        
        if (($lastballpos.x -le 2) -or ($lastballpos.x -gt $gridwidth*2-5))
        {$ballangle = 180 - $ballangle;}
        if ($lastballpos.y -le 1){$ballangle *= -1;}
        if ($lastballpos.y -ge $gridheight - 1){$ballstart = $true; 
            }
        if ($lastballpos.y -eq $padposition.y  -and 
            $lastballpos.x -gt $padposition.x-$padwidth-2 -and
            $lastballpos.x -lt $padposition.x+$padwidth+2 )
            {$ballangle *= -1; $ballangle += 10*($ballposition.x - $padposition.x);
                $setpos.CursorPosition = $padposition;
                Write-Host $n -BackgroundColor $padcolor;
                ShiftPad $padposition ($padwidth) -;
                Write-Host $n -BackgroundColor $padcolor;
                ShiftPad $padposition ($padwidth) +;
                Write-Host $n -BackgroundColor $padcolor;}
        
        if ($grid[$lastballpos.y, ($lastballpos.x / 2)] -ne $bgcolor )
        { 
            #if ($ballangle)
            $ballangle *= -1; $ballangle += 10*($ballposition.x - $lastballpos.x)
            $grid[$lastballpos.y, ($lastballpos.x / 2)] = $bgcolor;
            
        }
        #debug
        #$setpos.CursorPosition = $padposition;
        
        }
    

    Start-Sleep -Milliseconds (16);
} 



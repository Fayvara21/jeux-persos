# Créé par theodore, le 06/05/2021 en Python 3.4


import pygame
import random
from pygame.locals import*


game_isactive = True

numberofmines = 50
mousepos = ()
mouseclicleft = None
mouseclicright = None
firstclick = True
findingnumber = True
global flagcount
screenx = 600
screeny = 600
tilescale = (4,4)
tilesize = (8,8)
gridsize = (16, 16)
tilemapoffset = (80,80)
barpos = (8,80)
barhealth = 80
barspeed = 1
tilepos = ()
gameover = False
sortedtilelist = []
facepos = (19,0)
facecount = 0
combocount = 0
canplaysound = True
debrislist = []

pygame.init()

screen = pygame.display.set_mode((screenx, screeny))



caption = "DÉMINEUR 2K21 Edition: Game Of The Year"
pygame.display.set_caption(caption)

tile = pygame.transform.scale(pygame.image.load("tile.png"), (tilesize[0] * tilescale[0], tilesize[1]* tilescale[1]))
debris = pygame.transform.scale(pygame.image.load("debris.png"), (int(tilesize[0]/2) * tilescale[0], int(tilesize[1]/2)* tilescale[1]))
emptytile = [pygame.transform.scale(pygame.image.load("tileempty.png"), (tilesize[0] * tilescale[0], tilesize[1]* tilescale[1])),pygame.transform.scale(pygame.image.load("tile1.png"), (tilesize[0] * tilescale[0], tilesize[1]* tilescale[1])),pygame.transform.scale(pygame.image.load("tile2.png"), (tilesize[0] * tilescale[0], tilesize[1]* tilescale[1])),pygame.transform.scale(pygame.image.load("tile3.png"), (tilesize[0] * tilescale[0], tilesize[1]* tilescale[1])),pygame.transform.scale(pygame.image.load("tile4.png"), (tilesize[0] * tilescale[0], tilesize[1]* tilescale[1])),pygame.transform.scale(pygame.image.load("tile5.png"), (tilesize[0] * tilescale[0], tilesize[1]* tilescale[1])),pygame.transform.scale(pygame.image.load("tile6.png"), (tilesize[0] * tilescale[0], tilesize[1]* tilescale[1])),pygame.transform.scale(pygame.image.load("tile7.png"), (tilesize[0] * tilescale[0], tilesize[1]* tilescale[1])),pygame.transform.scale(pygame.image.load("tile8.png"), (tilesize[0] * tilescale[0], tilesize[1]* tilescale[1]))]
tileflag = pygame.transform.scale(pygame.image.load("tileflag.png"), (tilesize[0] * tilescale[0], tilesize[1]* tilescale[1]))
tilemine = pygame.transform.scale(pygame.image.load("tilemine.png"), (tilesize[0] * tilescale[0], tilesize[1]* tilescale[1]))
background = pygame.transform.scale(pygame.image.load("background.png"), (304 *2, 304 *2))
difficultybar = pygame.transform.scale(pygame.image.load("difficultybar.png"), (tilesize[0] * tilescale[0]*4, tilesize[1]* tilescale[1]))
face = [pygame.transform.scale(pygame.image.load("faceneutral.png"), (tilesize[0] * tilescale[0]*2, tilesize[1]* tilescale[1]*2)) , pygame.transform.scale(pygame.image.load("facesurprised.png"), (tilesize[0] * tilescale[0]*2, tilesize[1]* tilescale[1]*2)), pygame.transform.scale(pygame.image.load("facepog.png"), (tilesize[0] * tilescale[0]*2, tilesize[1]* tilescale[1]*2)), pygame.transform.scale(pygame.image.load("secret\dogg.png"), (tilesize[0] * tilescale[0]*2, tilesize[1]* tilescale[1]*2)), pygame.transform.scale(pygame.image.load("faceglasses.png"), (tilesize[0] * tilescale[0]*2, tilesize[1]* tilescale[1]*2)), pygame.transform.scale(pygame.image.load("facedead.png"), (tilesize[0] * tilescale[0]*2, tilesize[1]* tilescale[1]*2))]

pygame.display.set_icon(emptytile[random.randint(0,8)])


class Tiles(pygame.sprite.Sprite):


    def Tile(type,state,number, tileposx, tileposy):

        activetile = tile
        if type == "empty":
            if state == "unpressed":
                activetile = emptytile[0]
            else:
                activetile = emptytile[number]
        if type == "tile":
            activetile = tile
            if state == "pressed":
                activetile = emptytile[number]

        if type == "mine":
            if state == 'unpressed':
                activetile = tile
            else:
                activetile = tilemine
        if state == "flag":
            activetile = tileflag
        if state == "semi-pressed":
            activetile = emptytile[0]

        screen.blit(activetile, (tileposx, tileposy, tilesize[0] * tilescale[0], tilesize[1]* tilescale[1]))

    def explosion(positionX, positionY):
        posx = positionX
        posy = positionY
        velocity = [random.randint(-5, 5),random.randint(-15, 5)]
        rotation = random.randint(-180,180 )
        debrislist.append([positionX,positionY,velocity,rotation])


    def explosionupdate():

        isvisible = True

        indexdebris = 0

        for i in debrislist:

            if i[1] > screeny:
                debrislist.remove(debrislist[indexdebris])
            if isvisible == True:
                i[0] += i[2][0]
                i[1] += i[2][1]
                i[2][1] += 1
                i[3] += i[2][0]

                screen.blit(pygame.transform.rotate(debris,i[3]), (i[0] , i[1] , 0, 0))

    def button():
        global sortedtilelist
        global firstclick
        global gameover
        global combocount
        global facecount
        global barhealth
        sortedtilelist = []

        firstclick = True
        gameover = False
        combocount = 0
        facecount = 0
        barhealth = 0

    def maptiling():

        tileindex = 0
        tilemap = []
        tilelist = []

        for i in range(gridsize[0] * gridsize[1] - numberofmines):
            tilemap.append(("tile", "unpressed",0))
        for j in range(numberofmines):
            tilemap.append(("mine", "unpressed",0))

        random.shuffle(tilemap)

        for Y in range(gridsize[1]):
            for X in range(gridsize[0]):
                tilepos = (X * tilesize[0] * tilescale[0] + tilemapoffset[0],Y * tilesize[1] * tilescale[1] + tilemapoffset[1])
                tilelist.append((tilemap[tileindex], tilepos[0], tilepos[1]))
                tileindex += 1

        index2 = 0
        list1 = []
        for y in range(gridsize[1]):
            for x in range(gridsize[0]):
                list1.append(tilelist[index2])
                index2 += 1
            sortedtilelist.append(list1)
            list1 = []

        for x in range(gridsize[0]):
            for y in range(gridsize[1]):
                if sortedtilelist[y][x][0][0] == "mine" :
                    for i in range(3):
                        for j in range(3):
                            if y+j-1 >= 0 and y+j-1 < gridsize[1] and x+i-1 >= 0 and x+i-1 < gridsize[0]  :

                                sortedtilelist[y+j-1][x+i-1] = ((sortedtilelist[y+j-1][x+i-1][0][0],sortedtilelist[y+j-1][x+i-1][0][1],sortedtilelist[y+j-1][x+i-1][0][2] + 1),sortedtilelist[y+j-1][x+i-1][1],sortedtilelist[y+j-1][x+i-1][2])

Tiles.maptiling()
while game_isactive != False:

    screen.blit(background, (0, 0, 304 * tilescale[0], 304 * tilescale[1]))

    mousepos = pygame.mouse.get_pos()

    if (pygame.mouse.get_pressed()[0]) == 1:
        mouseclicleft = False

    if (pygame.mouse.get_pressed()[2]) == 1:
        mouseclicright = False

    if (pygame.mouse.get_pressed()[0]) == 0 and mouseclicleft == False:
        mouseclicleft = True

    if (pygame.mouse.get_pressed()[2]) == 0 and mouseclicright == False:
        mouseclicright = True

    for event in pygame.event.get():
        #print(event)

        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_ESCAPE:
                game_isactive = False

        if event.type == pygame.QUIT:
            game_isactive = False



    flagcount = 0


    for y in range(gridsize[1]):
        for x in range(gridsize[0]):

            if sortedtilelist[y-1][x-1][0][0] == 'mine' and sortedtilelist[y-1][x-1][0][1] == 'flag':
                flagcount += 1
                if flagcount == numberofmines:
                    gameover = True
                    facecount = 4

            if sortedtilelist[y-1][x-1][0][1] == 'semi-pressed':
                    sortedtilelist[y-1][x-1] = ((sortedtilelist[y-1][x-1][0][0],'unpressed',sortedtilelist[y-1][x-1][0][2]),sortedtilelist[y-1][x-1][1],sortedtilelist[y-1][x-1][2])

            if sortedtilelist[y][x][0][2] == 0 and sortedtilelist[y][x][0][0] == 'empty' and sortedtilelist[y][x][0][1] == 'pressed' and gameover != True:
                for i in range(3):
                    for j in range(3):
                        if y+j-1 >= 0 and y+j-1 < gridsize[1] and x+i-1 >= 0 and x+i-1 < gridsize[0] :
                            sortedtilelist[y+j-1][x+i-1] = (( 'empty','pressed',sortedtilelist[y+j-1][x+i-1][0][2]),sortedtilelist[y+j-1][x+i-1][1],sortedtilelist[y+j-1][x+i-1][2])

            if pygame.Rect.collidepoint(Rect(sortedtilelist[y-1][x-1][1],sortedtilelist[y-1][x-1][2],tilesize[0] * tilescale[0],tilesize[1]* tilescale[1]),mousepos) :
                if firstclick == True :
                    while sortedtilelist[y-1][x-1][0][2] != 0:
                        sortedtilelist = []
                        Tiles.maptiling()
                    if sortedtilelist[y-1][x-1][0][2] == 0 and sortedtilelist[y-1][x-1][0][0] == "empty":
                        firstclick = False


                if (pygame.mouse.get_pressed()[0] == 1 or pygame.mouse.get_pressed()[2] == 1 ) and sortedtilelist[y-1][x-1][0][1] == 'unpressed':
                    sortedtilelist[y-1][x-1] = ((sortedtilelist[y-1][x-1][0][0],'semi-pressed',sortedtilelist[y-1][x-1][0][2]),sortedtilelist[y-1][x-1][1],sortedtilelist[y-1][x-1][2])




                if mouseclicleft == True and sortedtilelist[y-1][x-1][0][1] != 'flag':



                    if sortedtilelist[y-1][x-1][0][0] == 'tile' and sortedtilelist[y-1][x-1][0][1] == 'unpressed':
                        sortedtilelist[y-1][x-1] = (('empty','pressed',sortedtilelist[y-1][x-1][0][2]),sortedtilelist[y-1][x-1][1],sortedtilelist[y-1][x-1][2])
                        barhealth = 80
                        combocount += 1
                        for w in range(4):
                            Tiles.explosion(sortedtilelist[y-1][x-1][1],sortedtilelist[y-1][x-1][2])

                    elif sortedtilelist[y-1][x-1][0][0] == 'mine' and gameover == False:
                        gameover = True
                        facecount = 5

                if mouseclicright == True:
                    if sortedtilelist[y-1][x-1][0][1] == 'unpressed' or sortedtilelist[y-1][x-1][0][1] == 'semi-pressed':
                        sortedtilelist[y-1][x-1] = ((sortedtilelist[y-1][x-1][0][0],'flag',sortedtilelist[y-1][x-1][0][2]),sortedtilelist[y-1][x-1][1],sortedtilelist[y-1][x-1][2])
                        barhealth = 80

                    elif sortedtilelist[y-1][x-1][0][1] == 'flag':
                        sortedtilelist[y-1][x-1] = ((sortedtilelist[y-1][x-1][0][0],'unpressed',sortedtilelist[y-1][x-1][0][2]),sortedtilelist[y-1][x-1][1],sortedtilelist[y-1][x-1][2])

            if gameover != True:
                Tiles.Tile(sortedtilelist[y-1][x-1][0][0],sortedtilelist[y-1][x-1][0][1],sortedtilelist[y-1][x-1][0][2],sortedtilelist[y-1][x-1][1],sortedtilelist[y-1][x-1][2])
            else:
                Tiles.Tile(sortedtilelist[y-1][x-1][0][0],"pressed",sortedtilelist[y-1][x-1][0][2],sortedtilelist[y-1][x-1][1],sortedtilelist[y-1][x-1][2])


    if barhealth >= 2 and firstclick == False:
        barhealth -= 2

        bar = pygame.transform.scale(pygame.image.load("bar.png"), (tilesize[0] * tilescale[0]*2,  tilescale[1]*barhealth*3) )
        screen.blit(bar, (barpos[0] , barpos[1] , tilesize[0] * tilescale[0]*2, tilescale[1]*barhealth*3))
    elif barhealth == 0 and facecount < 4 :
        combocount = 0
        facecount = 0
    if combocount == 5 and facecount < 3:
        facecount += 1
        combocount = 0


    screen.blit( pygame.transform.scale(pygame.image.load("tile.png"), (tilesize[0] * tilescale[0]*2, tilesize[1]* tilescale[1]*2)), (facepos[0]*16, facepos[1]*16, tilesize[0] * tilescale[0], tilesize[1]* tilescale[1]))
    screen.blit(face[facecount], (facepos[0]*16 , facepos[1]*16 , tilesize[0] * tilescale[0]*2, tilescale[1]*barhealth*3))
    screen.blit(difficultybar, (0 , 0 , 0, 0))
    Tiles.explosionupdate()

    if mouseclicleft == True:
        if pygame.Rect.collidepoint(Rect(facepos[0]*16 , facepos[1]*16 ,tilesize[0] * tilescale[0]*2,tilesize[1]* tilescale[1]*2),mousepos):
            Tiles.button()
            Tiles.maptiling()

        elif pygame.Rect.collidepoint(Rect(0 , 0 ,tilesize[0] * tilescale[0],tilesize[1]* tilescale[1]),mousepos):
            numberofmines = 15
            Tiles.button()
            Tiles.maptiling()

        elif pygame.Rect.collidepoint(Rect(tilesize[0] * tilescale[0] , 0 ,tilesize[0] * tilescale[0],tilesize[1]* tilescale[1]),mousepos):
            numberofmines = 30
            Tiles.button()
            Tiles.maptiling()

        elif pygame.Rect.collidepoint(Rect(tilesize[0] * tilescale[0]*2 , 0 ,tilesize[0] * tilescale[0],tilesize[1]* tilescale[1]),mousepos):
            numberofmines = 50
            Tiles.button()
            Tiles.maptiling()

        elif pygame.Rect.collidepoint(Rect(tilesize[0] * tilescale[0]*3 , 0 ,tilesize[0] * tilescale[0],tilesize[1]* tilescale[1]),mousepos):
            numberofmines = 70
            Tiles.button()
            Tiles.maptiling()



    if mouseclicleft == True:
        mouseclicleft = None
    if mouseclicright == True:
        mouseclicright = None
    pygame.display.update()


pygame.quit()
scene_rule = {}

local lesRegles = [[A toi petite tortue qui vient de naître, sauras-tu rejoindre la mer ?

Tu devras éviter ce que la Nature a mis sur ton chemin :

   * les crabes
   * les coraux
   * les oiseaux
   
   
Pour te deplacer utilise les flèches directionnelles <- et ->
   
   
J'oubliais, tu possèdes un super pouvoir : sauter ! grâce à la touche "ESPACE"

   * Tu peux sauter par dessus les crabes ( c'est quand même pas mal déjà ) 
   * Mais il est impossible de sauter par dessus les coraux et les oiseaux... ( faut pas déconner quand même ! )]]

local pannel
  
scene_rule.load = function()
   pannel = mGui.CreatePannel(0,0 ,650,800,transparent, blanc)
  pannel.addTexte("titre",0,50,"RèGLeS",titleFont,"center",pannel.L,bleu_kelo4)
  pannel.addTexte("text",50,200,lesRegles,textFont,"left",pannel.L-50,noir)
  
  
  pannel.addButton("back" ,pannel.L/3  ,pannel.H*0.8,pannel.L/3,pannel.H/10,"ReTouR",buttonFont,noir,blanc,noir)
  
  pannel.addSkin(endScreen)
  pannel.elt["back"].addSkin(bouton)
  
end


scene_rule.update = function(dt)
   pannel.update(dt,mouse.x , mouse.y)
end

scene_rule.draw = function()
   pannel.draw()
end

scene_rule.mousepressed = function(px,py,pbutton)
  
end

scene_rule.mousereleased = function(px,py,pbutton)
   if pannel.elt["back"].isIn(px,py) and pbutton==1 then
    scene_man.next_scene = scene_man.list["menu"]
    snd_clic_menu_2:play()
  end
end

scene_rule.mousemoved = function(px,py,pdx,pdy)

end

function scene_rule.keypressed(key)
 
    
end
function scene_rule.focus(focus)
  
end
function scene_rule.textinput(txt)

end
function scene_rule.quit()
  
end
return scene_rule

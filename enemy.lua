CRAB = "crabe"
BIRD = "oiseau"
CORAL = "corail"
HOLE = "trou"


enemy = {}

enemy.new = function(x, y, speed, type)
    local Enemy = {}
        Enemy.x = x
        Enemy.y = y 
        Enemy.speed = speed
        Enemy.type = type
        Enemy.image = nil
        Enemy.width = 200
        Enemy.height = 100
        Enemy.sx = nil
        Enemy.sy = nil
        Enemy.isAlive = true


        if Enemy.type == CRAB then
            Enemy.image = enemyImage.crab
            Enemy.animation = newAnimation(Enemy.image, Enemy.image:getWidth()/3, Enemy.image:getHeight(), 0.2, 3)
    
        elseif Enemy.type == BIRD then
            Enemy.image = enemyImage.bird
            Enemy.animation = newAnimation(Enemy.image, Enemy.image:getWidth()/2, Enemy.image:getHeight(), 0.2, 2)
    
        elseif Enemy.type == CORAL then
            Enemy.image = enemyImage.coral
            Enemy.animation = newAnimation(Enemy.image, Enemy.image:getWidth()/1, Enemy.image:getHeight(), 0.2, 1)
        
        elseif Enemy.type == HOLE then
            Enemy.image = enemyImage.hole
            Enemy.animation = newAnimation(Enemy.image, Enemy.image:getWidth()/1, Enemy.image:getHeight(), 0.2, 1)
    
        end

        Enemy.sx = Enemy.width/Enemy.image:getWidth()
        Enemy.sy = Enemy.height/Enemy.image:getHeight()
        
        function Enemy.update(dt)
            if Enemy.isAlive then
                Enemy.x = Enemy.x
                Enemy.y = Enemy.y + Enemy.speed*dt
                Enemy.animation:update(dt)
            end

            if Enemy.y > screen.H then
                Enemy.isAlive = false
            end
        end

        function Enemy.draw()
            if Enemy.isAlive and Enemy.y+Enemy.height > 0 then
                love.graphics.setColor(1, 1, 1)
                Enemy.animation:draw(Enemy.x, Enemy.y, 0, Enemy.sx)
            end
        end

        function Enemy.collision(persoX, persoY, persoHeight)
            if distance(persoX, persoY, Enemy.x, Enemy.y) < Enemy.height/2+persoHeight/2 then --Si la distance est positive
                return true
            else
                return false
            end
        end
    return Enemy
end
-- Can haz cheezburger functions

function hasWave()
    local wave = Tracker:ProviderCountForCode("wave")
    if wave >= 1 then
        return 1
    end
    return 0
end

function hasPlasma()
    local plasma = Tracker:ProviderCountForCode("plasma")
    if plasma >= 1 then
        return 1
    end
    return 0
end

function hasCharge()
    local charge = Tracker:ProviderCountForCode("charge")
    if charge >= 1 then
        return 1
    end
    return 0
end

function hasSpazer()
    local charge = Tracker:ProviderCountForCode("spazer")
    if charge >= 1 then
        return 1
    end
    return 0
end

function hasIce()
    local ice = Tracker:ProviderCountForCode("ice")
    if ice >= 1 then
        return 1
    end
    return 0
end

function hasHiJump()
    local hijump = Tracker:ProviderCountForCode("hijump")
    if hijump >= 1 then
        return 1
    end
    return 0
end


function hasSpaceJump()
    local space = Tracker:ProviderCountForCode("space")
    if space >= 1 then
        return 1
    end
    return 0
end

function hasVaria()
    local varia = Tracker:ProviderCountForCode("varia")
    if varia >= 1 then
        return 1
    end
    return 0
end

function hasGravity()
    local gravity = Tracker:ProviderCountForCode("gravity")
    if gravity >= 1 then
        return 1
    end
    return 0
end

function hasGrapple()
    local grapple = Tracker:ProviderCountForCode("grapple")
    if grapple >= 1 then
        return 1
    end
    return 0
end

function hasBasicBombs()
    local bomb = Tracker:ProviderCountForCode("bomb")
    if bomb >= 1 then
        return 1
    end
    return 0
end

function countPB()
    return Tracker:ProviderCountForCode("powerbomb")
end

function hasPowerBombs()
    if countPB() >= 1 then
        return 1
    end
    return 0
end

function hasBombs()
    if hasBasicBombs() == 1 or hasPowerBombs() == 1 then
        return 1
    end
    return 0
end

function hasMorph()
    local morph = Tracker:ProviderCountForCode("morph")
    if morph >= 1 then
        return 1
    end
    return 0
end

function hasMissiles()
    local missile = Tracker:ProviderCountForCode("missile")
    if missile >= 1 then
        return 1
    end
    return 0
end

function hasSuper()
    local super = Tracker:ProviderCountForCode("super")
    if super >= 1 then
        return 1
    end
    return 0
end

function countTanks()
    local etanks = Tracker:ProviderCountForCode("etank")
    local reservetanks = Tracker:ProviderCountForCode("reservetank")
    return etanks + reservetanks
end

function hasScrewAttack()
    local screw = Tracker:ProviderCountForCode("screw")
    if screw >= 1 then
        return 1
    end
    return 0
end

function hasSpringBall()
    local spring = Tracker:ProviderCountForCode("spring")
    if spring >= 1 then
        return 1
    end
    return 0
end

function hasGravity()
    local gravity = Tracker:ProviderCountForCode("gravity")
    if gravity >= 1 then
        return 1
    end
    return 0
end

function hasSpeedBooster()
    local speed = Tracker:ProviderCountForCode("speed")
    if speed >= 1 then
        return 1
    end
    return 0
end


-- Can do the things functions

function heatProof()
    if hasVaria() == 1 then
        return 1
    end
    return 0
end

function canHellRun()
    if heatProof() == 1 or countTanks() >= 3 then
        return 1
    end
    return 0
end

function canBomb()
    if hasMorph() == 1 and hasBasicBombs() == 1 then
        return 1
    end
    return 0
end

function canPowerBomb()
    if hasMorph() == 1 and hasPowerBombs() == 1 then
        return 1
    end
    return 0
end

function canFly()
    if hasSpaceJump() == 1 or canBomb() == 1 then
        return 1
    end
    return 0
end

function canOpenRedDoors()
    if hasMissiles() == 1 or hasSuper() == 1 then
        return 1
    end
    return 0
end

function canOpenGreenDoors()
    if hasSuper() == 1 then
        return 1
    end
    return 0
end

function canOpenYellowDoors()
    if canPowerBomb() == 1 then
        return 1
    end
    return 0
end

function canBombWalls()
    if canBomb() == 1 or canPowerBomb() == 1 or hasScrewAttack() == 1 then
        return 1
    end
    return 0
end

function canBombPassages()
    if canBomb() == 1 or canPowerBomb() == 1 then
        return 1
    end
    return 0
end

function canDoSuitlessMaridia()
    if hasHiJump() == 1 and hasGrapple() == 1 and (hasIce() == 1 or hasSpringBall() == 1) then
        return 1
    end
    return 0
end


-- Access logic functions

function canAccessGauntlet()
    if (
            canBomb() == 1 or
                    (canPowerBomb() == 1 and countPB() >= 10) or
                    hasScrewAttack() == 1 or
                    (hasSpeedBooster() == 1 and canPowerBomb() == 1 and countTanks() >= 2)
    ) then
        return 1
    end
    return 0
end

function canAccessRedBrinstar()
    if hasSuper() == 1 and ((hasMorph() == 1 and canBombWalls() == 1) or canPowerBomb() == 1) then
        return 1
    end
    return 0
end

function canAccessPinkBrinstar()
    if canPowerBomb() == 1 or (canOpenRedDoors() == 1 and (canBombWalls() == 1 or hasSpeedBooster() == 1)) then
        return 1
    end
    return 0
end

function canAccessKraid()
    if canAccessRedBrinstar() == 1 and canBombPassages() == 1 then
        return 1
    end
    return 0
end

function canAccessHeatedNorfair()
    if canAccessRedBrinstar() == 1 and canHellRun() == 1 then
        return 1
    end
    return 0
end

function canAccessCrocomire()
    if canAccessHeatedNorfair() == 1 or
            (canAccessKraid() == 1 and canPowerBomb() == 1 and hasSpeedBooster() == 1 and countTanks() >= 2)
    then
        return 1
    end
    return 0
end

function canAccessNorfairReserve()
    if canAccessHeatedNorfair() == 1 and
            (canFly() == 1 or hasGrapple() == 1 or hasIce() == 1 or hasSpringBall() == 1 or hasHiJump() == 1)
    then
        return 1
    end
    return 0
end

function canAccessLowerNorfair()
    if canAccessHeatedNorfair() == 1 and canPowerBomb() == 1 and hasVaria() == 1 and
            (hasHiJump() == 1 or hasGravity() == 1)
    then
        return 1
    end
    return 0
end

function canDoWorstRoom()
    if canAccessLowerNorfair() == 1 and (
            canFly() == 1 or
                    (hasIce() == 1 and hasCharge() == 1) or
                    hasHiJump() == 1 or
                    hasSpringBall() == 1
    ) then
        return 1
    end
    return 0
end

function canDoWorstRoomDASH()
    -- Sequence break with starter charge if you have ice beam.
    if canAccessLowerNorfair() == 1 and hasIce() == 1 then
        return 1
    end
    return 0
end

function canAccessWreckedShip()
    if hasSuper() == 1 and canPowerBomb() == 1 then
        return 1
    end
    return 0
end

function canAccessGravity()
    if canAccessWreckedShip() == 1 and (hasVaria() == 1 or countTanks() >= 1) then
        return 1
    end
    return 0
end

function canAccessWreckedShipReserve()
    if canAccessWreckedShip() == 1 and hasSpeedBooster() == 1 and
            ((hasVaria() == 1 and countTanks() >= 1) or countTanks() >= 2) then
        return 1
    end
    return 0
end

function canAccessOuterMaridia()
    if canAccessRedBrinstar() == 1 and canPowerBomb() == 1 and
            (hasGravity() == 1 or (hasHiJump() == 1 and (hasIce() == 1 or hasSpringBall() == 1)))
    then
        return 1
    end
    return 0
end

function canAccessInnerMaridia()
    if canAccessRedBrinstar() == 1 and canPowerBomb() == 1 and hasGravity() == 1 then
        return 1
    end
    return 0
end

function canAccessBotwoon()
    if canAccessRedBrinstar() == 1 and canPowerBomb() == 1 and
            (hasIce() == 1 or hasSpeedBooster() == 1) and
            (hasGravity() == 1 or (canDoSuitlessMaridia() == 1 and hasIce() == 1))
    then
        return 1
    end
    return 0
end

function canAccessBotwoonDASH()
    -- Spazer opens Waterway and Botwoon hallway in DASH
    if canAccessRedBrinstar() == 1 and canPowerBomb() == 1 and hasSpazer() == 1 and
            (hasGravity() == 1 or canDoSuitlessMaridia() == 1)
    then
        return 1
    end
    return 0
end

function canAccessDraygon()
    if canAccessBotwoon() == 1 and hasGravity() == 1 then
        return 1
    end
    return 0
end

function canAccessDraygonDASH()
    if canAccessBotwoonDASH() == 1 and hasGravity() == 1 then
        return 1
    end
    return 0
end

function canAccessPlasma()
    if canAccessDraygon() == 1 and
            ((hasCharge() == 1 and countTanks() >= 3) or hasScrewAttack() == 1 or hasPlasma() == 1) and
            (canFly() == 1 or hasHiJump() == 1 or hasSpringBall() == 1 or hasSpeedBooster() == 1)
    then
        return 1
    end
    return 0
end

function canAccessPlasmaDASH()
    -- Samus begins with starter Charge Beam in DASH that does 30% charged shot damage.
    -- Pseudo Screws and SBAs do full damage with starter Charge Beam.
    -- For DASH sequence break, ignore weapon requirements because of this.
    if (canAccessDraygon() == 1 or canAccessDraygonDASH() == 1) and
            (canFly() == 1 or hasHiJump() == 1 or hasSpringBall() == 1 or hasSpeedBooster() == 1)
    then
        return 1
    end
    return 0
end

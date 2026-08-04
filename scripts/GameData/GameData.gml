//action library

global.actionLibrary = {
    
    attack: {
        name: "Attack",
        description: "{0} attacks!",
        subMenu: -1,
        targetRequired: true,
        targetEnemyByDefault: true,
        targetAll: Mode.Never,
        userAnimation: "attack",
        effectSprite: spr_hit,
        effectOnTarget: Mode.Always,
        sound: attack_haru, // ← ADD THIS LINE (replace snd_attack with your actual sound name)
        func: function(_user, _targets) {
            var _damage = _user.strength;
            BattleChangeHP(_targets[0], -_damage, 0);
            BattleChangeMP(_user, +1);
        } 
    },
    
 
         
sword_bash: {

    name: "Sword bash",
    description: "{0} bashes and stuns the enemy!",
    itemDescription: "2 MP. Deals damage and stuns one foe",
    subMenu: "Magic",
    lvlUnlock: 2,
    user: "Haru",
    mpCost: 2,
    targetRequired: true,
    targetEnemyByDefault: true,
    targetAll: Mode.Never,
    userAnimation: "attack",
    sound : sword_bash,
    effectSprite: spr_hit,
    effectOnTarget: Mode.Always,

    func: function(_user, _targets) {
        var _t = _targets[0];

        // Normal attack damage
        var _damage = _user.strength;
        BattleChangeHP(_t, -_damage, 0);

        // Apply stun for 1 turn
        var stunDebuff = createStunDebuff(1);
        array_push(_t.debuffs, stunDebuff);

        // MP Cost
        BattleChangeMP(_user, -mpCost);
    }
},
    
    hellfire: {

                name: "hellfire",
                description: "{0} casts hellfire!",
                itemDescription:"4 MP. Strong fire strike that burns enemies",  
                subMenu:"Magic",
                lvlUnlock: 5,
                user:"Haru",  
                mpCost: 4,
                targetRequired: true, 
                targetEnemyByDefault: true,
                targetAll: Mode.Never,
                userAnimation:"cast",
                sound: Hellfire_luna,
                effectSprite: spr_hit,
                 effectOnTarget: Mode.Always,
                  
                func: function(_user, _targets) {
                    
                var _damage = _user.strength * 2 + 3;
                BattleChangeHP(_targets[0], -_damage/*, 0*/);
                  BattleChangeMP(_user, -mpCost);
                  
                  
                    //creates the debuff for 3 turns
                  var burnedDebuff = createBurnedDebuff(3);
                  array_push(_targets[0].debuffs, burnedDebuff);
                    //with (_targets[0]) hp = max(0, hp - _damage);
        } 
    },

         Lunar_beam: {
    name: "Lunar Beam",
    description: "{0} fires a Lunar Beam!",
    itemDescription: "3 MP. Deals 2x STR as lunar damage.",
    subMenu: "Magic",
    lvlUnlock: 2,      // or whatever level you want
    user: "Maya",
    mpCost: 3,
    targetRequired: true,
    targetEnemyByDefault: true,
    targetAll: Mode.Never,
    userAnimation: "cast",
    //sound: maya_lunar_beam, // <- replace with your actual sound
    effectSprite: spr_hit,  // <- replace with a moon-themed sprite if you have one
    effectOnTarget: Mode.Always,

    func: function(_user, _targets) {
        var _t = _targets[0];

        // Damage = 2x Strength
        var _damage = _user.strength * 2;
        BattleChangeHP(_t, -_damage, 0);

        // MP cost
        BattleChangeMP(_user, -mpCost);
    }
},
         
    purify: {


         name: "Heal",
         description: "{0} casts a Heal",
         itemDescription:"5 MP. Restores a moderate amount of HP.",
         subMenu: "Magic",
         lvlUnlock: 2,
         user:"Maya",
         mpCost: 5,
         targetRequired: true,
         targetEnemyByDefault: false,
         targetAll: Mode.Never,
         userAnimation: "cast",
        sound : Maya_Heal,
         effectSprite: spr_warp,
         effectOnTarget: Mode.Always,
         func: function(_user, _targets) {
                  if (!IsAlly(_user, _targets[0])) return;
         var _baseHeal = _user.hpmax * 0.5 
         var _heal = ceil(_baseHeal + random_range(-_baseHeal * 0.1, _baseHeal * 0.1));
         BattleChangeHP(_targets[0], _heal);
                  BattleChangeMP(_user, -mpCost);
         }
},

         
         
    Moonlight_purge: {
                  
    name: "Moonlight Purge",
    description: "{0} purifies!",
    itemDescription: "10 MP. Cleanses all debuffs from an ally.",
    subMenu: "Magic",
    lvlUnlock: 4,
    user: "Maya",
    mpCost: 10,
    targetRequired: true,
    targetEnemyByDefault: false,
    targetAll: Mode.Never,
    userAnimation: "cast",
    sound: moonlight_purge,
    effectSprite: spr_warp,
    effectOnTarget: Mode.Always,

    func: function(_user, _targets) {
        var _t = _targets[0];
        if (!IsAlly(_user, _t)) return;

        // remove MP
        BattleChangeMP(_user, -mpCost);

        // create and apply cleanse buff
        var clean = createCleanseBuff();
        clean.apply(_t);

        // show "cured"
        BattleChangeHP(_t, 0, 0, c_aqua);
        oBattle.battleText = _t.name + " is cured!";
    }
},
         
         escape : 
	{
		name : "Escape",
		description : "",
		subMenu : -1,
		targetRequired: false,
		func : function(_user, _target)
		{
			if (random(1) < 0.8) //success
			{
				oBattle.escaped = true;
			}
			else //fail
			{
				oBattle.battleText = "Failed to escape!";
			}
		}		
	},
          //-------------------------------------------------//MONSTERS SKILLS---------------------------------------------------------------------//
         
    //blue slime
    Poison_Split: {

               name: "Attack",
                description: "{0} spits acid!",
                subMenu: -1,
                targetRequired: true,
                targetEnemyByDefault: true,
                targetAll: Mode.Never,
                userAnimation: "attack",
                effectSprite: spr_hit,
                effectOnTarget: Mode.Always,
                func: function(_user, _targets) {
                    
                var _damage = _user.strength;//ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
                BattleChangeHP(_targets[0], -_damage, 0);
                    
                    
                       //creates the debuff for 3 turns
                  var poisonedDebuff = createPoisonDebuff(2);
                  array_push(_targets[0].debuffs, poisonedDebuff);
                    //with (_targets[0]) hp = max(0, hp - _damage);
                  
                  
                  //temporary for testing
                  //var poisonDebuff = createPoisonDebuff(3);
                  //array_push(_targets[0].debuffs, poisonDebuff);
        } 
    },

         Burning_Spit: {
    name: "Burning Spit",
    description: "{0} spits burning slime!",
    subMenu: -1,
    targetRequired: true,
    targetEnemyByDefault: true,
    targetAll: Mode.Never,

    userAnimation: "attack",
    effectSprite: spr_hit,
    effectOnTarget: Mode.Always,

    func: function(_user, _targets) {
        var _t = _targets[0];

        // 🔥 Damage = just its base strength
        var _damage = _user.strength;
        BattleChangeHP(_t, -_damage, 0);

        // 🔥 Apply 3-turn Burn debuff
        var burnDebuff = createBurnedDebuff(3);
        array_push(_t.debuffs, burnDebuff);
    }
},
    
    
    
     thrust: {
                name: "thrust",
                description: "{0} attacks!",
                subMenu: -1,
                targetRequired: true,
                targetEnemyByDefault: true,
                targetAll: Mode.Never,
                userAnimation: "attack",
                effectSprite: spr_hit,
                effectOnTarget: Mode.Always,
                func: function(_user, _targets) {
                    
                var _damage = _user.strength;//ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
                BattleChangeHP(_targets[0], -_damage, 0);
                    
                    //with (_targets[0]) hp = max(0, hp - _damage);
                  
                  
                  //temporary for testing
                  //var poisonDebuff = createPoisonDebuff(3);
                  //array_push(_targets[0].debuffs, poisonDebuff);
        } 
    },
    
    
    discharge: {
                name: "discharge",
                description: "{0} attacks!",
                subMenu: -1,
                targetRequired: true,
                targetEnemyByDefault: true,
                targetAll: Mode.Never,
                userAnimation: "attack",
                effectSprite: spr_hit,
                effectOnTarget: Mode.Always,
                func: function(_user, _targets) {
                    
                var _damage = _user.strength * 6;//ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
                BattleChangeHP(_targets[0], -_damage, 0);
                    
                    //with (_targets[0]) hp = max(0, hp - _damage);
                  
                  
                  //temporary for testing
                  //var poisonDebuff = createPoisonDebuff(3);
                  //array_push(_targets[0].debuffs, poisonDebuff);
        } 
    },

         
    
    
    
    
         //-------------------------------------------------//BOSS SKILLS---------------------------------------------------------------------//
         
         
         //ruined titan skills
         Stone_fist: {
                  name:"Stone fist",
                  description:"{0} attacks with stone first",
                  subMenu: -1,
                  targetRequired: true,
                targetEnemyByDefault: true,
                targetAll: Mode.Never,
                userAnimation: "attack",
                effectSprite: spr_hit,
                effectOnTarget: Mode.Always,
                func: function(_user, _targets) {
                    
                var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
                BattleChangeHP(_targets[0], -_damage, 0);
                    
                    
        } 
         },
         
         Earthshatter_Slam: {
                           name:"Earth slammer",
                           description: "{0} slammed the ground!",
                           subMenu: -1,
                           targetRequired: true,
                           targetEnemyByDefault: true,
                           targetAll: Mode.Always,
                           userAnimation: "attack",
                           effectSprite: spr_hit,
                           effectOnTarget: Mode.Always,
                           func: function(_user, _targets) {
                    
                var _damage = _user.strength;//ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
                BattleChangeHP(_targets[0], -_damage, 0);
                    
                                   
                                    if (random(1) < 0.4) { // 80% chance
                                    var stunDebuff = createStunDebuff(3);
                                     array_push(_targets[0].debuffs, stunDebuff);
}
                    
        } 
         },
    
         
         Cursed_malfunction: {
                  name:"System malfunction",
                  description: "{0} acts on its own",
                  subMenu: -1,
                           targetRequired: true,
                           targetEnemyByDefault: true,
                           targetAll: Mode.Always,
                           userAnimation: "attack",
                           effectSprite: spr_hit,
                           effectOnTarget: Mode.Always,
                           func: function(_user, _targets) {
        var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));

        // Force targets to be ALL enemies of the user
        if (_user.isBoss || array_contains(global.enemies, _user)) {
            // user is an enemy → hit all party units
            _targets = array_filter(oBattle.partyUnits, function(u, i) { return (u.hp > 0); });
        } else {
            // user is a party member → hit all enemy units
            _targets = array_filter(oBattle.enemyUnits, function(u, i) { return (u.hp > 0); });
        }

        // Apply damage to each valid target
        for (var i = 0; i < array_length(_targets); i++) {
            BattleChangeHP(_targets[i], -_damage, 0);
        }
    }
},

        Lunar_slash: {
             name:"Lunar Slash",
                  description: "{0} Slashes at the party making a sonic boom",
                  subMenu: -1,
                           targetRequired: true,
                           targetEnemyByDefault: true,
                           targetAll: Mode.Always,
                           userAnimation: "attack",
                           effectSprite: spr_hit,
                           effectOnTarget: Mode.Always,
                           func: function(_user, _targets) {
        var _damage = 5 //ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));

        // Force targets to be ALL enemies of the user
        if (_user.isBoss || array_contains(global.enemies, _user)) {
            // user is an enemy → hit all party units
            _targets = array_filter(oBattle.partyUnits, function(u, i) { return (u.hp > 0); });
        } else {
            // user is a party member → hit all enemy units
            _targets = array_filter(oBattle.enemyUnits, function(u, i) { return (u.hp > 0); });
        }

        // Apply damage to each valid target
        for (var i = 0; i < array_length(_targets); i++) {
            BattleChangeHP(_targets[i], -_damage, 0);
        }
    }
        },
        pounce: {
                name: "Pounce",
                description: "{0} attacks!",
                subMenu: -1,
                targetRequired: true,
                targetEnemyByDefault: true,
                targetAll: Mode.Never,
                userAnimation: "attack",
                effectSprite: spr_hit,
                effectOnTarget: Mode.Always,
                func: function(_user, _targets) {
                    
                var _damage = _user.strength;//ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
                BattleChangeHP(_targets[0], -_damage, 0);
                    
                  BattleChangeMP(_user, +1);
                    //with (_targets[0]) hp = max(0, hp - _damage);
                  
                  
                  //temporary for testing
                  //var poisonDebuff = createPoisonDebuff(3);
                  //array_push(_targets[0].debuffs, poisonDebuff);
        } 
    },
         
        
        Shade_Slice: {
            name:"Shade slice",
                  description: "{0} slashes a soul",
                  subMenu: -1,
                           targetRequired: true,
                           targetEnemyByDefault: true,
                           targetAll: Mode.Always,
                           userAnimation: "attack",
                           effectSprite: spr_hit,
                           effectOnTarget: Mode.Always,
                           func: function(_user, _targets) {
                    
                var _damage = _user.strength //ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
                BattleChangeHP(_targets[0], -_damage, 0);
                    
                    
        } 
                        
            
        },
        
        
        Soul_harvest: {
             name:"Soul harvest",
                  description: "{0} uses Soul Harvest",
                  subMenu: -1,
                           targetRequired: true,
                           targetEnemyByDefault: true,
                           targetAll: Mode.Always,
                           userAnimation: "attack",
                           effectSprite: spr_hit,
                           effectOnTarget: Mode.Always,
                           func: function(_user, _targets) {
        var _damage = 9999 //ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));

        // Force targets to be ALL enemies of the user
        if (_user.isBoss || array_contains(global.enemies, _user)) {
            // user is an enemy → hit all party units
            _targets = array_filter(oBattle.partyUnits, function(u, i) { return (u.hp > 0); });
        } else {
            // user is a party member → hit all enemy units
            _targets = array_filter(oBattle.enemyUnits, function(u, i) { return (u.hp > 0); });
        }

        // Apply damage to each valid target
        for (var i = 0; i < array_length(_targets); i++) {
            BattleChangeHP(_targets[i], -_damage, 0);
        }
    }
        }

         
         
        
         
         
         
}


enum Mode {
    Never = 0,
    Always = 1,
    Varies = 2
}











//---------------------------------------------PARTY UNITS------------------------------------------------------//








//Party Units
global.party = [
           {
                name: "Haru",
                hp: 15,   
                hpmax: 15,
                mp: 5,
                mpmax: 5, 
                strength: 4,
                level:1,
                  currentXp:8,
                  xpLevelUp:scr_get_xp_required("Haru", 1),
                  
                debuffs: [],
                sprites: {
                    idle: battle_haru, 
                    attack: battle_haru, 
                    defend: battle_haru,
                    cast: battle_haru,
                    down: fainted_haru
                },
                    actions: [global.actionLibrary.attack, global.actionLibrary.escape]
            },

{
                name: "Maya",
                hp: 10,
                hpmax:10,
                mp:20,
                mpmax:20,
                strength: 2,
                debuffs: [],
                  level:1,
                  currentXp:5,
                  xpLevelUp: scr_get_xp_required("Maya", 1),   
                    sprites: {
                        idle: battle_maya, 
                        attack: battle_maya, 
                        defend: battle_maya,
                        cast: battle_maya,
                        down: faint_maya
                    },
    
                    actions:[global.actionLibrary.attack, global.actionLibrary.purify, global.actionLibrary.escape]
    
}

        ];



//----------------------------------------ENEMY UNITS------------------------------------------------------//



//Enemy Units
global.enemies = {
    
   //act 1
         Tutorial_Slime: {
                  name:"Slime",
                        hp: 5,   
                        hpmax: 5,
                        mp: 5,
                        mpmax: 5, 
                        strength: 6,
                        goldDrop:scr_get_gold_drop_act1,    
                        debuffs: [],
                        xpValue: 3,
                        isBoss:false,      
                        sprites: {
                            idle: spr_slime_green_idle, 
                            attack: spr_slime_green_idle, 
                            defend: spr_slime_green_idle
                              },
                        actions: [global.actionLibrary.attack],
                        xp_Value:2,
                        AIscript: function() {
                           
                           var _action = actions[0];

                              var _possibleTargets = array_filter(oBattle.partyUnits, function(_unit, _index) {
                                  return (_unit.hp > 0);
                              });
                              
                              if (array_length(_possibleTargets) == 0) return -1; // safety check
                              
                              // Sort targets by lowest HP percentage
                              array_sort(_possibleTargets, function(a, b) {
                                  var a_percent = a.hp / a.hpmax;
                                  var b_percent = b.hp / b.hpmax;
                                  return a_percent - b_percent;
                              });
                              
                              // 50% chance to prioritize lowest HP target, 30% chance to choose randomly for variety
                              var _target;
                              if (random(1) < 0.3) {
                                  _target = _possibleTargets[0]; // lowest HP %
                              } else {
                                  _target = _possibleTargets[irandom(array_length(_possibleTargets) - 1)];
                              }
                              
                              return [_action, _target];



                           }         



         },
    
    Bandit: {
                        name:"Bandit",
                        hp: 10,   
                        hpmax: 10,
                        mp: 5,
                        mpmax: 5, 
                        strength: 2,
                        goldDrop:scr_get_gold_drop_act1,    
                        debuffs: [],
                        xpValue: 4,
                        isBoss:false,      
                        sprites: {
                            idle: side_idle_corrupted_bandit,//spr_Bandit2, 
                            attack: side_idle_corrupted_bandit, 
                            defend: side_idle_corrupted_bandit
            },
                            actions:[global.actionLibrary.attack],
                            xp_Value:5,
                            AIscript: function() {
                               var _action = actions[0];
    
    var _possibleTargets = array_filter(oBattle.partyUnits, function(_unit, _index) {
        return (_unit.hp > 0);
    });
    
    if (array_length(_possibleTargets) == 0) return -1;
    
    // Find Haru and Maya
    var _haru = undefined;
    var _maya = undefined;
    
    for (var i = 0; i < array_length(_possibleTargets); i++) {
        if (_possibleTargets[i].name == "Haru") _haru = _possibleTargets[i];
        if (_possibleTargets[i].name == "Maya") _maya = _possibleTargets[i];
    }
    
    var _target;
    
    // Check if Haru exists and is above 50% HP
    if (!is_undefined(_haru) && (_haru.hp / _haru.hpmax) > 0.5) {
        // Haru is healthy - prioritize him
        var roll = random(1);
        if (roll < 0.70) {
            // 70% chance to target Haru
            _target = _haru;
        } else {
            // 30% chance to target Maya (or random if Maya is dead)
            if (!is_undefined(_maya)) {
                _target = _maya;
            } else {
                _target = _possibleTargets[irandom(array_length(_possibleTargets) - 1)];
            }
        }
    } else {
        // Haru is below 50% HP or dead - randomize targeting
        _target = _possibleTargets[irandom(array_length(_possibleTargets) - 1)];
    }
    
    return [_action, _target];

                                
                            }
                                    },
         
         
         //act 1
         Green_Slime: {
                  name:"Slime",
                        hp: 5,   
                        hpmax: 5,
                        mp: 5,
                        mpmax: 5, 
                        strength: 2,
                        goldDrop:scr_get_gold_drop_act1,    
                        debuffs: [],
                        xpValue: 3,
                        isBoss:false,      
                        sprites: {
                            idle: spr_slime_green_idle, 
                            attack: spr_slime_green_idle, 
                            defend: spr_slime_green_idle
                              },
                        actions: [global.actionLibrary.attack],
                        xp_Value:2,
                        AIscript: function() {
                           
                           var _action = actions[0];

                              var _possibleTargets = array_filter(oBattle.partyUnits, function(_unit, _index) {
                                  return (_unit.hp > 0);
                              });
                              
                              if (array_length(_possibleTargets) == 0) return -1; // safety check
                              
                              // Sort targets by lowest HP percentage
                              array_sort(_possibleTargets, function(a, b) {
                                  var a_percent = a.hp / a.hpmax;
                                  var b_percent = b.hp / b.hpmax;
                                  return a_percent - b_percent;
                              });
                              
                              // 50% chance to prioritize lowest HP target, 30% chance to choose randomly for variety
                              var _target;
                              if (random(1) < 0.3) {
                                  _target = _possibleTargets[0]; // lowest HP %
                              } else {
                                  _target = _possibleTargets[irandom(array_length(_possibleTargets) - 1)];
                              }
                              
                              return [_action, _target];



                           }         



         },
    
    //act 2
    purple_slime: {

                 name:"PSlime",
                        hp: 15,   
                        hpmax: 15,
                        mp: 5,
                        mpmax: 5, 
                        strength: 1,
                        goldDrop:scr_get_gold_drop_act2,    
                        debuffs: [],
                        xpValue: 10,
                        isBoss:false,      
                        sprites: {
                            idle: slime_purple_idle, 
                            attack: slime_purple_idle, 
                            defend: slime_purple_idle
                              },
                        actions:[global.actionLibrary.Poison_Split],
                        xp_Value:2,
                        AIscript: function() {
                           
                           var _action = actions[0];

                              var _possibleTargets = array_filter(oBattle.partyUnits, function(_unit, _index) {
                                  return (_unit.hp > 0);
                              });
                              
                              if (array_length(_possibleTargets) == 0) return -1; // safety check
                              
                              // Sort targets by lowest HP percentage
                              array_sort(_possibleTargets, function(a, b) {
                                  var a_percent = a.hp / a.hpmax;
                                  var b_percent = b.hp / b.hpmax;
                                  return a_percent - b_percent;
                              });
                              
                              // 50% chance to prioritize lowest HP target, 30% chance to choose randomly for variety
                              var _target;
                              if (random(1) < 0.3) {
                                  _target = _possibleTargets[0]; // lowest HP %
                              } else {
                                  _target = _possibleTargets[irandom(array_length(_possibleTargets) - 1)];
                              }
                              
                              return [_action, _target];



                           }         



        

    },
    //act 3
   red_slime: {

                 name:"Slime",
                        hp: 35,   
                        hpmax: 35,
                        mp: 5,
                        mpmax: 5, 
                        strength: 1,
                        debuffs: [],
                        goldDrop:scr_get_gold_drop_act3,    
                        xpValue: 10,
                        isBoss:false,      
                        sprites: {
                            idle: slime_red_idle, 
                            attack: slime_red_idle, 
                            defend: slime_red_idle
                              },
                        actions:[global.actionLibrary.Burning_Spit],
                        xp_Value:2,
                        AIscript: function() {
                           
                           var _action = actions[0];

                              var _possibleTargets = array_filter(oBattle.partyUnits, function(_unit, _index) {
                                  return (_unit.hp > 0);
                              });
                              
                              if (array_length(_possibleTargets) == 0) return -1; // safety check
                              
                              // Sort targets by lowest HP percentage
                              array_sort(_possibleTargets, function(a, b) {
                                  var a_percent = a.hp / a.hpmax;
                                  var b_percent = b.hp / b.hpmax;
                                  return a_percent - b_percent;
                              });
                              
                              // 50% chance to prioritize lowest HP target, 30% chance to choose randomly for variety
                              var _target;
                              if (random(1) < 0.3) {
                                  _target = _possibleTargets[0]; // lowest HP %
                              } else {
                                  _target = _possibleTargets[irandom(array_length(_possibleTargets) - 1)];
                              }
                              
                              return [_action, _target];



                           }         

            

        

    },   
         
    
    //act 2
    footman: {

                         name:"footman",
                        hp: 15,   
                        hpmax: 15,
                        mp: 5,
                        mpmax: 5, 
                        strength: 4,
                        goldDrop:scr_get_gold_drop_act2,    
                        debuffs: [],
                        xpValue: 15,
                        isBoss:false,      
                        sprites: {
                            idle: side_idle_corrupted_footman, 
                            attack: side_idle_corrupted_footman, 
                            defend: side_idle_corrupted_footman
                              },
                        actions:[global.actionLibrary.thrust],
                        //xp_Value:2,
                        AIscript: function() {
                           
                           var _action = actions[0];

                              var _possibleTargets = array_filter(oBattle.partyUnits, function(_unit, _index) {
                                  return (_unit.hp > 0);
                              });
                              
                              if (array_length(_possibleTargets) == 0) return -1; // safety check
                              
                              // Sort targets by lowest HP percentage
                              array_sort(_possibleTargets, function(a, b) {
                                  var a_percent = a.hp / a.hpmax;
                                  var b_percent = b.hp / b.hpmax;
                                  return a_percent - b_percent;
                              });
                              
                              // 50% chance to prioritize lowest HP target, 30% chance to choose randomly for variety
                              var _target;
                              if (random(1) < 0.3) {
                                  _target = _possibleTargets[0]; // lowest HP %
                              } else {
                                  _target = _possibleTargets[irandom(array_length(_possibleTargets) - 1)];
                              }
                              
                              return [_action, _target];



                           }         

            

        

    },
    
    knight: {

                         name:"knight",
                        hp: 18,   
                        hpmax: 18,
                        mp: 5,
                        mpmax: 5, 
                        strength: 4,
                        goldDrop:scr_get_gold_drop_act2,    
                        debuffs: [],
                        xpValue: 20,
                        isBoss:false,      
                        sprites: {
                            idle: side_idle_corrupted_footman, 
                            attack: side_idle_corrupted_footman, 
                            defend: side_idle_corrupted_footman
                              },
                        actions:[global.actionLibrary.thrust],
                        //xp_Value:2,
                        AIscript: function() {
                           
                           var _action = actions[0];

                              var _possibleTargets = array_filter(oBattle.partyUnits, function(_unit, _index) {
                                  return (_unit.hp > 0);
                              });
                              
                              if (array_length(_possibleTargets) == 0) return -1; // safety check
                              
                              // Sort targets by lowest HP percentage
                              array_sort(_possibleTargets, function(a, b) {
                                  var a_percent = a.hp / a.hpmax;
                                  var b_percent = b.hp / b.hpmax;
                                  return a_percent - b_percent;
                              });
                              
                              // 50% chance to prioritize lowest HP target, 30% chance to choose randomly for variety
                              var _target;
                              if (random(1) < 0.3) {
                                  _target = _possibleTargets[0]; // lowest HP %
                              } else {
                                  _target = _possibleTargets[irandom(array_length(_possibleTargets) - 1)];
                              }
                              
                              return [_action, _target];



                           }         

            

        

    },
    
    //act 3
    eclipse_sprite: {


                        name:"Sprite",
                        hp: 10,   
                        hpmax: 10,
                        mp: 5,
                        mpmax: 5, 
                        strength: 2,
                        goldDrop:scr_get_gold_drop_act3,    
                        debuffs: [],
                        xpValue: 30,
                        isBoss:false,      
                        sprites: {
                            idle: eclipse_sprite, 
                            attack: eclipse_sprite, 
                            defend: eclipse_sprite
                              },
                        actions:[global.actionLibrary.discharge],
                        //xp_Value:2,
                        AIscript: function() {
                           
                           var _action = actions[0];

                              var _possibleTargets = array_filter(oBattle.partyUnits, function(_unit, _index) {
                                  return (_unit.hp > 0);
                              });
                              
                              if (array_length(_possibleTargets) == 0) return -1; // safety check
                              
                              // Sort targets by lowest HP percentage
                              array_sort(_possibleTargets, function(a, b) {
                                  var a_percent = a.hp / a.hpmax;
                                  var b_percent = b.hp / b.hpmax;
                                  return a_percent - b_percent;
                              });
                              
                              // 50% chance to prioritize lowest HP target, 30% chance to choose randomly for variety
                              var _target;
                              if (random(1) < 0.3) {
                                  _target = _possibleTargets[0]; // lowest HP %
                              } else {
                                  _target = _possibleTargets[irandom(array_length(_possibleTargets) - 1)];
                              }
                              
                              return [_action, _target];



                           }         




    },
    
    //act 3
    eclipse_Wraiths: {


                        name:"Wraiths",
                        hp: 10,   
                        hpmax: 10,
                        mp: 5,
                        mpmax: 5, 
                        strength: 3,
                        goldDrop:scr_get_gold_drop_act3,    
                        debuffs: [],
                        xpValue: 5,
                        isBoss:false,      
                        sprites: {
                            idle: Twilight_Wraith, 
                            attack: Twilight_Wraith, 
                            defend: Twilight_Wraith
                              },
                        actions:[global.actionLibrary.pounce],
                        //xp_Value:2,
                        AIscript: function() {
                           
                           var _action = actions[0];

                              var _possibleTargets = array_filter(oBattle.partyUnits, function(_unit, _index) {
                                  return (_unit.hp > 0);
                              });
                              
                              if (array_length(_possibleTargets) == 0) return -1; // safety check
                              
                              // Sort targets by lowest HP percentage
                              array_sort(_possibleTargets, function(a, b) {
                                  var a_percent = a.hp / a.hpmax;
                                  var b_percent = b.hp / b.hpmax;
                                  return a_percent - b_percent;
                              });
                              
                              // 50% chance to prioritize lowest HP target, 30% chance to choose randomly for variety
                              var _target;
                              if (random(1) < 0.3) {
                                  _target = _possibleTargets[0]; // lowest HP %
                              } else {
                                  _target = _possibleTargets[irandom(array_length(_possibleTargets) - 1)];
                              }
                              
                              return [_action, _target];



                           }         




    },

         
         Commander_knights: {
                  name: "Commander",
                  hp:25,
                  hpmax:25,
                  mp:10,
                  mpmax:10,
                  strength:5,
                  goldDrop:scr_get_gold_drop_act4,
                  debuff:[],
                  xpValue:15,
                  isBoss:false,
                  sprites:{
                           idle:side_idle_corrupted_commander,
                           attack:side_idle_corrupted_commander,
                           defend:side_idle_corrupted_commander
                           
                  },
                  actions:[global.actionLibrary.attack],
                  AIscript: function(){
                           var _action = actions[0];
    
    var _possibleTargets = array_filter(oBattle.partyUnits, function(_unit, _index) {
        return (_unit.hp > 0);
    });
    
    if (array_length(_possibleTargets) == 0) return -1;
    
    // Find Haru and Maya
    var _haru = undefined;
    var _maya = undefined;
    
    for (var i = 0; i < array_length(_possibleTargets); i++) {
        if (_possibleTargets[i].name == "Haru") _haru = _possibleTargets[i];
        if (_possibleTargets[i].name == "Maya") _maya = _possibleTargets[i];
    }
    
    var _target;
    
    // Check if Haru exists and is above 50% HP
    if (!is_undefined(_haru) && (_haru.hp / _haru.hpmax) > 0.5) {
        // Haru is healthy - prioritize him
        var roll = random(1);
        if (roll < 0.70) {
            // 70% chance to target Haru
            _target = _haru;
        } else {
            // 30% chance to target Maya (or random if Maya is dead)
            if (!is_undefined(_maya)) {
                _target = _maya;
            } else {
                _target = _possibleTargets[irandom(array_length(_possibleTargets) - 1)];
            }
        }
    } else {
        // Haru is below 50% HP or dead - randomize targeting
        _target = _possibleTargets[irandom(array_length(_possibleTargets) - 1)];
    }
    
    return [_action, _target];

                  },
         },
    
    
    
    
         
         
         
         
         
         
//----------------------------------------------bosses------------------------------------------------------------//


Ruined_Titan: {
                                    name:"Titan",
                                    hp:60,
                                    hpmax:60,
                                    mp:40,
                                    mpmax:40,
                                    strength:4,
                                    goldDrop:ruined_titanDrop,
                                    debuffs:[],
                                    xpValue: 80,
                                    isBoss: true,
                                    bossID: 1,
                                    sprites: {
                                             idle: ruin_titan,
                                             attack: ruin_titan,
                                             defend: ruin_titan
                                    },
                                    actions: [global.actionLibrary.Stone_fist,global.actionLibrary.Earthshatter_Slam],
                                    AIscript: function() {
    // Initialize counter if it doesn't exist
    if (!variable_instance_exists(id, "aiCounter")) {
        aiCounter = 0;
    }
    
    aiCounter += 1; // Count turns
    
    var _action;
    
    // Every 3rd turn: pick from actions[1..end] (ignore actions[0])
    if (aiCounter mod 3 == 0) {
        if (array_length(actions) > 1) {
            _action = actions[1 + irandom(array_length(actions) - 2)];
        } else {
            _action = actions[0]; // fallback if only one action exists
        }
    } 
    // Other turns: always use actions[0] (Stone Fist)
    else {
        _action = actions[0];
    }
    
    // Find possible targets
    var _possibleTargets = array_filter(oBattle.partyUnits, function(_unit, _index) {
        return (_unit.hp > 0);
    });
    
    if (array_length(_possibleTargets) == 0) return -1; // safety check
    
    // Sort targets by lowest HP %
    array_sort(_possibleTargets, function(a, b) {
        return (a.hp / a.hpmax) - (b.hp / b.hpmax);
    });
    
    // 20% chance: attack lowest HP, otherwise random
    var _target;
    if (random(1) < 0.2) {
        _target = _possibleTargets[0];
    } else {
        _target = _possibleTargets[irandom(array_length(_possibleTargets) - 1)];
    }
    
    return [_action, _target];
}

                                    
},
         
    
         
         
         
         
         
         
         Lucian_The_Herald: { 
                                    name:"Lucian", 
                                    hp:100, 
                                    hpmax:100, 
                                    mp:40,
                                    mpmax:40,
                                    strength:5,
                                    goldDrop:lucian_drop,
                                    debuffs:[],
                                    xpValue: 200,
                                    isBoss: true,
                                    bossID: 2,
                                    sprites: {
                                             idle: lucian_the_herald,
                                             attack: lucian_the_herald,
                                             defend: lucian_the_herald
                                    },
                                    actions: [global.actionLibrary.attack, global.actionLibrary.Lunar_slash],
                                    aiCounter: 0,
                                    AIscript: function() {

    // Increase turn counter
    aiCounter++;

    var _possibleTargets = array_filter(oBattle.partyUnits, function(_unit) {
        return (_unit.hp > 0);
    });

    if (array_length(_possibleTargets) == 0) return -1;

    // Sort targets by lowest HP %
    array_sort(_possibleTargets, function(a, b) {
        return (a.hp / a.hpmax) - (b.hp / b.hpmax);
    });

    var _target;

    // 50% lowest HP or random, same as before
    if (random(1) < 0.5) {
        _target = _possibleTargets[0];
    } else {
        _target = _possibleTargets[ irandom(array_length(_possibleTargets)-1) ];
    }

    // --- USE LUNAR SLASH EVERY 3rd TURN ---
    if (aiCounter mod 3 == 0) {
        return [ actions[1], _target ];  // Lunar Slash
    }

    // --- Otherwise normal attack ---
    return [ actions[0], _target ];
}


                                    
},

    
    Dusk_reaper: { 
                                    name:"Reaper", 
                                    hp:80, 
                                    hpmax:80, 
                                    mp:40,
                                    mpmax:40,
                                    strength:5,
                                    goldDrop:duskReaperDrop,
                                    debuffs:[],
                                    xpValue: 200,
                                    isBoss: true,
                                    bossID: 3,
                                    sprites: {
                                             idle: dusk_reaper,
                                             attack: dusk_reaper,
                                             defend: dusk_reaper
                                    },
                                    actions: [global.actionLibrary.Shade_Slice, global.actionLibrary.Soul_harvest],
                                    aiCounter: 0,
                                    AIscript: function() {

    // Increase turn counter
    aiCounter++;

    var _possibleTargets = array_filter(oBattle.partyUnits, function(_unit) {
        return (_unit.hp > 0);
    });

    if (array_length(_possibleTargets) == 0) return -1;

    // Sort targets by lowest HP %
    array_sort(_possibleTargets, function(a, b) {
        return (a.hp / a.hpmax) - (b.hp / b.hpmax);
    });

    var _target;

    // 50% lowest HP or random, same as before
    if (random(1) < 0.5) {
        _target = _possibleTargets[0];
    } else {
        _target = _possibleTargets[ irandom(array_length(_possibleTargets)-1) ];
    }

    // --- USE LUNAR SLASH EVERY 3rd TURN ---
    if (aiCounter mod 10 == 0) {
        return [ actions[1], _target ];  // Lunar Slash
    }

    // --- Otherwise normal attack ---
    return [ actions[0], _target ];
}


                                    
},

    
    
    
    
   

    Maya_VesselOfCalamity: {
                                    name:"Vessel", 
                                    hp:100, 
                                    hpmax:100, 
                                    mp:40,
                                    mpmax:40,
                                    strength:6,
                                    goldDrop:corruptedMaya,
                                    debuffs:[],
                                    xpValue: 200,
                                    isBoss: true,
                                    bossID: 4,
                                    sprites: {
                                             idle:corrupted_maya,
                                             attack: corrupted_maya,
                                             defend: corrupted_maya
                                    },
                                    actions: [global.actionLibrary.Shade_Slice, global.actionLibrary.Soul_harvest],
                                    aiCounter: 0,
                                    AIscript: function() {

    // Increase turn counter
    aiCounter++;

    var _possibleTargets = array_filter(oBattle.partyUnits, function(_unit) {
        return (_unit.hp > 0);
    });

    if (array_length(_possibleTargets) == 0) return -1;

    // Sort targets by lowest HP %
    array_sort(_possibleTargets, function(a, b) {
        return (a.hp / a.hpmax) - (b.hp / b.hpmax);
    });

    var _target;

    // 50% lowest HP or random, same as before
    if (random(1) < 0.5) {
        _target = _possibleTargets[0];
    } else {
        _target = _possibleTargets[ irandom(array_length(_possibleTargets)-1) ];
    }

    // --- USE LUNAR SLASH EVERY 3rd TURN ---
    if (aiCounter mod 10 == 0) {
        return [ actions[1], _target ];  // Lunar Slash
    }

    // --- Otherwise normal attack ---
    return [ actions[0], _target ];
}
    }
    


    }

    
    
         




//-------------------------------------INVENTORY STORAGE SYSTEM-----------------------------------------------------------------------------//



global.items = {
         
         small_potion : 
                           {
                                    name : "Small Potion",
                                    description : "{0} uses a Potion!",
                                    subMenu : "Item",
                                    itemDescription: "heals 10hp of the user",
                                    price: 25,
                                    sprite: Small_Potion_of_Health,
                                    targetRequired: true,
                                    targetEnemyByDefault: false, //0: party/self, 1: enemy
                                    targetAll: Mode.Never,
                                    func : function(_user, _targets)
                                    {
                                             if (!IsAlly(_user, _targets[0])) return;
                                             var _heal = 10;
                                             BattleChangeHP(_targets[0], _heal);
                                    }		
                           },
    
    Large_potion : 
                            {
                                        name : "Large Potion",
                                        description : "{0} uses a Potion!",
                                        itemDescription: "heals 20 hp of the user",
                                        subMenu : "Item",
                                        price: 50,
                                        sprite: Large_Potion_of_Health,
                                        targetRequired: true,
                                        targetEnemyByDefault: false, //0: party/self, 1: enemy
                                        targetAll: Mode.Never,
                                        func : function(_user, _targets)
                                        {
                                             if (!IsAlly(_user, _targets[0])) return;
                                                var _heal = 20;
                                                BattleChangeHP(_targets[0], _heal);
                                        }		
                            },
         
         small_mana_potion : 
                  {
                           name : "Small mana potion",
                           description : "{0} uses an Small mana potion!",
                           itemDescription: "Recovers 5mp of the user",
                           price: 25,
                           sprite: Small_Potion_of_Mana,  
                           subMenu : "Item",
                           targetEnemyByDefault: false, //0: party/self, 1: enemy
                           targetAll: Mode.Never,
                           targetRequired: true,
                           func : function(_user, _targets)
                           {        
                                    if (!IsAlly(_user, _targets[0])) return;
                                    var _healMP = 5;
                                    BattleChangeMP(_targets[0], _healMP, true);
                           }		
                  },
    
    
    large_mana_potion : 
                    {
                            name : "Large mana potion",
                            description : "{0} uses an Small mana potion!",
                            itemDescription: "Recovers 10mp for the user",
                            price: 50,
                            sprite: Large_Potion_of_Mana,
                            subMenu : "Item",
                            targetEnemyByDefault: false, //0: party/self, 1: enemy
                            targetAll: Mode.Never,
                            targetRequired: true,
                            func : function(_user, _targets)
                            {           
                                        if (!IsAlly(_user, _targets[0])) return; 
                                        var _healMP = 10;
                                        BattleChangeMP(_targets[0], _healMP, true);
                            }		
                    },
         
         revive : 
                  {
                           name : "Revive",
                           description : "{0} uses a Revive!",
                           itemDescription: "Revives a fallen ally upon use",
                           subMenu : "Item",
                           price: 200,
                           sprite: Revive, 
                           targetEnemyByDefault: false, //0: party/self, 1: enemy
                           targetAll: Mode.Never,
                           targetRequired: true,
                           func : function(_user, _targets)
                           {
                                    var _heal = 30;
                                    BattleChangeHP(_targets[0], _heal, 1);
                           }		
                  }
         
         
}







//------------------------------------------------------Inventory------------------------------------------------------------------------------//
global.inventory =
[
         //[global.items.Large_potion, 4],
         //[global.items.revive, 2],
         //[global.items.small_mana_potion, 1],
           [global.items.small_potion, 1]
]




function RemoveItemFromInventory(_item, _amount)
{
	
	for (var i = 0; i < array_length(global.inventory); i++)
	{
		if (global.inventory[i][0] == _item)
		{
			global.inventory[i][1] -= _amount;
			break;
		}
	}
         
         
}


//For rune system
function UpdatePartyStatsFromRunes() {
    var haru = global.party[0];
    var maya = global.party[1];

    var h_runes = global.haru_runes;
    var m_runes = global.maya_runes;

    // --- HARU ---
    var haru_base = global.haruStats[clamp(haru.level - 1, 0, 9)];
    var bonus_hp  = global.rune_stats.red[clamp(h_runes[0] - 1, 0, 4)];
    var bonus_str = global.rune_stats.yellow[clamp(h_runes[1] - 1, 0, 4)];
    var bonus_mp  = global.rune_stats.blue[clamp(h_runes[2] - 1, 0, 4)];

    haru.hpmax    = haru_base.hp + bonus_hp;
    haru.strength = haru_base.strength + bonus_str;
    haru.mpmax    = haru_base.mp + bonus_mp;

    haru.hp = clamp(haru.hp, 0, haru.hpmax);
    haru.mp = clamp(haru.mp, 0, haru.mpmax);

    // --- MAYA ---
    var maya_base = global.mayaStats[clamp(maya.level - 1, 0, 9)];
    var bonus_hp  = global.rune_stats.red[clamp(m_runes[0] - 1, 0, 4)];
    var bonus_str = global.rune_stats.yellow[clamp(m_runes[1] - 1, 0, 4)];
    var bonus_mp  = global.rune_stats.blue[clamp(m_runes[2] - 1, 0, 4)];

    maya.hpmax    = maya_base.hp + bonus_hp;
    maya.strength = maya_base.strength + bonus_str;
    maya.mpmax    = maya_base.mp + bonus_mp;

    maya.hp = clamp(maya.hp, 0, maya.hpmax);
    maya.mp = clamp(maya.mp, 0, maya.mpmax);

    // Update globals
    global.party[0] = haru;
    global.party[1] = maya;
}



// --- Boss progress tracker (4 bosses) ---
// false = not yet defeated; true = defeated
global.bosses = [ false, false, false, false ]; // bossIDs: 1..4 -> stored at index (bossID-1)




function GetMaxLevelUnlocked() {
    var _b = global.bosses;
    
    if (!_b[0]) return 3; // Before boss 1 defeated
    else if (!_b[1]) return 5; // After boss 1
    else if (!_b[2]) return 7; // After boss 2
    else if (!_b[3]) return 9; // After boss 3
    else return 10;            // After boss 4
}


function scr_get_xp_required(_name, _level)
{
    // XP tables stored locally in the function
   var xpHaru = [0, 10, 20, 40, 70, 120, 180, 250, 330, 420, 500];   // medium pace
var xpMaya = [0, 15, 30, 60, 100, 170, 250, 330, 400, 450, 500]; // slow pace
    //var xpMaya = [0, 10, 15, 80, 100, 170, 250, 330, 400, 450, 500]; sample
     
    // Default fallback (if name not found or level out of range)
    var defaultXp = 9999;

    switch (_name)
    {
        case "Haru":
            if (_level >= 1 && _level < array_length(xpHaru))
                return xpHaru[_level];
            else
                return xpHaru[array_length(xpHaru) - 1];

        case "Maya":
            if (_level >= 1 && _level < array_length(xpMaya))
                return xpMaya[_level];
            else
                return xpMaya[array_length(xpMaya) - 1];
    }

    return defaultXp;
}

         
function IsAlly(_user, _target) {
    // If both are party units → ally
    if (array_contains(oBattle.partyUnits, _user) && array_contains(oBattle.partyUnits, _target)) return true;
    // If both are enemies → ally
    if (array_contains(oBattle.enemyUnits, _user) && array_contains(oBattle.enemyUnits, _target)) return true;
    return false; // otherwise, different sides → not ally
}








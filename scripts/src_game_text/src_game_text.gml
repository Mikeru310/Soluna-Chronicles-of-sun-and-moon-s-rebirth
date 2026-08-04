 /// @param text_id

function src_game_text(_text_id){
    
    switch(_text_id)    {
        
         
         case "cave dialogue 1":
    src_text("Haru:Ugh... it's so dark in here. I can barely see anything.");
    src_text("Maya:This used to be an old mineshaft. No one's been here in years.");
    src_text("Haru:That explains the creepy silence…");
    src_text("Maya:There should be a glow crystal nearby. If we activate it, the path should light up.");
    src_text("Haru:Good. Because I'm two steps away from walking into a wall.");
    src_text("Maya:Just stay close. Let's find that crystal.");
                   src_text("Guide:Glow Crystals are scattered around the cave.");
    src_text("Guide:Press Z to interact with a crystal and illuminate the area for 5 seconds.");
break;
        
         
         case "inn dialogue 1":
                  src_text("Maya:Hey Haru look! The inn is finally finished.");
                  src_text("Haru:Already? That was fast.");
                  src_text("Maya:Yeah! Every village has one so travellers can rest here. We should check it out.");
                  src_text("Haru:Good idea. Never hurts to know where we can recover.");
                  break;
                  
         
         case "inn dialogue 2":
    src_text("Reception Lady:Welcome to the new Gladeheart Inn! You must be Haru and Maya.");
    src_text("Maya:We just wanted to see how it turned out. It looks great inside!");
    src_text("Reception Lady:Thank you! If you're ever tired, you can rest here for a small fee.");
    src_text("Haru:A fee, huh? How much?");
    src_text("Reception Lady:Just enough to keep the inn running. Talk to me at the counter anytime you need a room.");
    src_text("Maya:Sounds fair. Come on, Haru no excuses to skip resting now.");
    src_text("Haru:Hey! I rest when I need to!");
                  src_text("The Inn is now available. You can SAVE your progress here, or rest here to recover HP and MP.")
break;




         
         
         
         
         
         
         
        case "rune_tutorial":
             src_text("Rune Altar:Welcome to the Rune Altar.");
    src_text("Rune Altar:Runes enhance your stats when equipped.");
    src_text("Rune Altar:Red = HP, Yellow = ATK, Blue = MP.");
    src_text("Rune Altar:Each rune can be upgraded up to Level 5.");
    src_text("Rune Altar:Upgrade cost = (current level + 1) x 100 gold.");
    src_text("Rune Altar:Use [LEFT ARROW] and [RIGHT ARROW] to choose a character, [UP AND DOWN ARROW] to select runes.");
    src_text("Rune Altar:Press [Z] to upgrade and [X] to exit.");
            break;
         
        case "party_member_down":
         src_text("Downed party unit stored 50% hp revival");
         break;
        
        
        case "Swamp save":
                  src_text("Bandit receptionist:Welcome... if you need a room, we'll do our best to make your stay peaceful");
                  src_option("Save", "Swamp save Yes");
                  src_option("Rest-Heal", "inn heal");
                  break;
                  
                 
        
                    case "Swamp save Yes":
                           src_text("Bandit receptionist:Thank you have a good stay");
                           textbox_callback = function() {
                           save_game_json(); // <-- Call your save script here
    }
                           src_text("GAME SAVED");
                           break;
        
        
        
        
        
        
        
        
        case "Swamp shop":
            src_text("Bandit:Welcome to our 'shop.' Prices are high, attitudes higher.");
            textbox_callback = function() {
                instance_create_layer(0,0, "Instances",Swamp_shop)
            }
            break;
        
        
        
        case "Swamp shop exit":
            src_text("Bandit:Take care! And by that I mean, don't come crying back.");
            break;
        
        
        
        



         case "mountain shop":
                  {
                           
                           var Mgreetings = [
                "Michael:Welcome! Take a look around.",
                "Michael:Looking to buy something?",
                "Michael:Need supplies? I've got what you need.",
                "Michael:Ah, a customer! Have a look.",
                "Michael:Greetings. My goods are open for browsing."
            ];
                  var mpick = Mgreetings[irandom(array_length(Mgreetings) -1)];
            src_text(mpick);
                           
                           
                           textbox_callback = function(){
                instance_create_layer(0,0, "Instances", obj_mountainShop)
            };
                           
                  }
        
        break;





         case "mountain exit":
        var Mexit = [
            "Michael:Come again anytime.",
            "Michael:Safe travels",
            "Michael:Thanks for stopping by",
            "Michael:See you around",
            "Michael:Take care out there"
        ];
        
        var Mpick = Mexit[irandom(array_length(Mexit) -1)];
        src_text(Mpick);
        break;










        
        case "Plain shop": {
            var Pgreetings = [
                "Mark:Welcome! Take a look around.",
                "Mark:Looking to buy something?",
                "Mark:Need supplies? I've got what you need.",
                "Mark:Ah, a customer! Have a look.",
                "Mark:Greetings. My goods are open for browsing."
            ];
            
            var Ppick = Pgreetings[irandom(array_length(Pgreetings) -1)];
            src_text(Ppick);
            
            textbox_callback = function(){
                instance_create_layer(0,0, "Instances", Plain_shop)
            };
        }
            
         break;
    
    
    
    case "Plains exit":
        var Pexit = [
            "Mark:Come again anytime.",
            "Mark:Safe travels",
            "Mark:Thanks for stopping by",
            "Mark:See you around",
            "Mark:Take care out there"
        ];
        
        var ppick = Pexit[irandom(array_length(Pexit) -1)];
        src_text(ppick);
        break;
            
            
            
            
            
            
            
            
         case "Forest shop": {

    var greetings = [
        "Jerstine:Hey you two ,Stay a moment. I've got new supplies that might help you out.",
        "Jerstine:Perfect timing, you two. I restocked just this morning.",
        "Jerstine:If you're heading deeper into the forest, you'll want to check my new items.",
        "Jerstine:Ah, Haru! I've saved some of my best goods for you.",
        "Jerstine:Got something special in today. Might be useful on your journey."
    ];

    // pick a random greeting
    var pick = greetings[irandom(array_length(greetings) - 1)];
    src_text(pick);

    // open the Forest Shop object after dialogue ends
    textbox_callback = function () {
        instance_create_layer(0, 0, "Instances", Forest_shop);
    };

} break;
                  
                  
                  
                  case "Forest shop exit":
                           var fexit = [
                                    "Jerstine:Take care, you two. Come back anytime.",
                                    "Jerstine:If you need a break, my shop's always open for you.",
                                    "Jerstine:Travel safely. I'll be right here when you return.",
                                    "Jerstine:Come back soon. It's always nice seeing you both.",
                                    "Jerstine:Try not to get hurt, alright? I'd hate to see you struggling."
                           ];
                           
                           var fpick = fexit[irandom(array_length(fexit) -1)]
                           src_text(fpick);
                           break;
         
         
         //---------------------------------NPCs FOR Act 2 Interiors--------------------------------------------------------------------------------//                           
                                    
                                   //Plain Shop NPC
                                   case "Plain_Shop_NPC1":
                                          src_text("Maria:I've been coming here since I was a little. Not much has changed, really...");
                                          break;
                                   
                                   //Plain Inn NPC
                                   case "Plain_Inn_NPC1":
                                          src_text("Emman:If you need anything, just talk over there up front.");
                                          src_text("Haru:Thank you.");
                                          src_text("Emman:No problem. Enjoy your stay.");
                                          break;
                                   
                                   //Plain Interior NPC1
                                   case "Plain_Interior_NPC1":
                                          src_text("Mira:Oh hey there. Didn't expect anyone to just walk in.");
                                          src_text("Haru:Sorry, I didn't mean to barge in.");
                                          src_text("Mira:It's alright. You look harmless enough. Need somethin'?");
                                          break;
                                   
                                   //Plain Interior NPC2
                                   case "Plain_Interior_NPC2":
                                          src_text("Jalen:Whoa, didn't hear you come in. You alright?");
                                          src_text("Haru:Yeah, just passing through.");
                                          src_text("Jalen:Gotcha. Door sticks a bit huh? Thought it was the wind again.");
                                          break;
                                   
                                   //Plain Interior NPC3
                                   case "Plain_Interior_NPC3":
                                          src_text("Tessa:Oh hi. You new around here?");
                                          src_text("Haru:Yeah, just got in.");
                                          src_text("Tessa:Well welcome. Not much to see but it's home.");
                                          break;
                                   
                                   //Plain Interior NPC4
                                   case "Plain_Interior_NPC4":
                                          src_text("Corin:Hey, wasn't expecting company. You lost or just looking around?");
                                          src_text("Haru:Just looking, sorry if it's weird.");
                                          src_text("Corin:Nah, it's fine. Happens more than you'd think.");
                                          break;
                                   
                                   //Plain Interior NPC5
                                   case "Plain_Interior_NPC5":
                                          src_text("Rhea:Oh hi there! You came outta nowhere.");
                                          src_text("Haru:Sorry about that.");
                                          src_text("Rhea:No big deal. Scared me more than anything. You're fine.");
                                          break;
                                   
                                   //Plain Interior NPC6
                                   case "Plain_Interior_NPC6":
                                          src_text("Darin:Hey stranger. Didn't think anyone would walk right in.");
                                          src_text("Haru:My bad. I can step back out if I'm bothering you.");
                                          src_text("Darin:You're good. Just caught me off guard, that's all.");
                                          break;
                                   
                                   //Plain Interior NPC7
                                   case "Plain_Interior_NPC7":
                                          src_text("Elda:Oh someone's here. You look tired, long day?");
                                          src_text("Haru:Kinda, yeah. Been walking a lot.");
                                          src_text("Elda:Then take a breather. Floor's clean enough, promise.");
                                          break;
                                   
                                   //Plain Interior NPC8
                                   case "Plain_Interior_NPC8":
                                          src_text("Rowan:Hey uh hi. You looking for someone?");
                                          src_text("Haru:No, just exploring. Didn't mean to intrude.");
                                          src_text("Rowan:No worries. You're not the first to wander in by mistake.");
                                          break;
                                   
                                   //Plain Interior NPC9
                                   case "Plain_Interior_NPC9":
                                          src_text("Nilo:Oh hi. Didn't expect a visitor. You new in town?");
                                          src_text("Haru:Yeah, just got here.");
                                          src_text("Nilo:Cool. Folks here are decent. You'll fit in fine.");
                                          break; 
                                   
         //---------------------------------NPCs FOR Act 2------------------------------------------------------------------------------------------//
                                   
                                   //Plain Town NPC1
                                    case "Plain_Town_NPC1":
                                        src_text("Tarin:I don't think I've seen you around before. You new in town?");
                                        src_text("Haru:Yeah, just got here.");
                                        src_text("Tarin:Well, nothing crazy happens here most days.");
                                        src_text("Haru:That's fine by me.");
                                        break;
                                    
                                    //Plain Town NPC2
                                    case "Plain_Town_NPC2":
                                        src_text("Sera:It's nice out today. Good day for a walk.");
                                        src_text("Haru:Yeah, feels pretty calm.");
                                        break;
                                    
                                    //Plain Town NPC3
                                    case "Plain_Town_NPC3":
                                        src_text("Renn:Hey, haven't seen you before. Are you new here?");
                                        src_text("Haru:Yeah, just passing through.");
                                        src_text("Renn:Well, hope the town treats you alright.");
                                        src_text("Haru:Thanks, so far so good.");
                                        break;
                                    
                                    //Plain Town NPC4
                                    case "Plain_Town_NPC4":
                                        src_text("Frenz:Some kid tried to sell me a rock earlier. Said it was lucky.");
                                        src_text("Haru:Did you buy it?");
                                        src_text("Frenz:No, but he tried real hard to convince me.");
                                        src_text("Haru:That's funny.");
                                        break;
                                    
                                    //Plain Town NPC5
                                    case "Plain_Town_NPC5":
                                        src_text("Maro:Been a slow day. Nothing going on at all.");
                                        src_text("Haru:Slow days can be nice.");
                                        src_text("Maro:Yeah, gives me time to breathe.");
                                        src_text("Haru:True.");
                                        break;
                                    
                                    //Plain Town NPC6
                                    case "Plain_Town_NPC6":
                                        src_text("Hollis:Hi. Need any help?");
                                        src_text("Haru:No, I'm good.");
                                        src_text("Hollis:Okay. Just checking.");
                                        src_text("Haru:Thanks.");
                                        break;
                                    
                                    //Plain Town NPC7
                                    case "Plain_Town_NPC7":
                                        src_text("Elen:Hey there. How's your day?");
                                        src_text("Haru:Pretty good.");
                                        src_text("Elen:That's nice. Take it easy out there.");
                                        src_text("Haru:Yeah, thanks.");
                                        break;
                                    
                                    //Plain Town NPC8
                                    case "Plain_Town_NPC8":
                                        src_text("Lysa:Hi there, first time in town?");
                                        src_text("Haru:Yeah, just arrived.");
                                        src_text("Lysa:Hope you like it here. It's a quiet place.");
                                        src_text("Haru:Thanks.");
                                        break;
                                    
                                    //Plain Town NPC9
                                    case "Plain_Town_NPC9":
                                        src_text("Rallo:You look new around here. Need anything for your travels?");
                                        src_text("Haru:Just checking things out for now.");
                                        src_text("Rallo:No problem. My shop's always open.");
                                        src_text("Haru:Thanks, I'll remember that.");
                                        src_text("Rallo:Take your time.");
                                        break;
                                    
         //---------------------------------NPCs FOR Act 3 Interiors--------------------------------------------------------------------------------//                  
                                   
                                   //Swamp Shop NPC
                                   case "Swamp_Shop_NPC1":
                                          src_text("Brakk:Well well... a new face. Didn't think anyone would come this deep.");
                                          src_text("Haru:Yeah, I'm just looking around.");
                                          src_text("Brakk:Heh, look all you want. Just don't break anything. Stuff's hard to find out here.");
                                          src_text("Haru:I'll be careful.");
                                          src_text("Brakk:Good.");
                                          break;
                                   
                                   //Swamp Inn NPC
                                   case "Swamp_Inn_NPC1":
                                          src_text("Adre:If you're lookin for anything, go over there can help you out.");
                                          src_text("Haru:Thank you.");
                                          src_text("Adre:Sure thing. Hope you stay comfortable.");
                                          break;
                                   
                                   //Swamp Interior NPC1
                                   case "Swamp_Interior_NPC1":
                                          src_text("Rook:Well look at you walkin in like you own the place.");
                                          src_text("Haru:Sorry, didn't mean to bother you.");
                                          src_text("Rook:Yeah well, watch where you step in next time.");
                                          break;
                                   
                                   //Swamp Interior NPC2
                                   case "Swamp_Interior_NPC2":
                                          src_text("Grint:Heh, brave of you to walk in here without knocking.");
                                          src_text("Haru:My mistake.");
                                          src_text("Grint:Just don't make a habit of it.");
                                          break;
                                   
                                   //Swamp Interior NPC3
                                   case "Swamp_Interior_NPC3":
                                          src_text("Salla:You lost?");
                                          src_text("Haru:Just looking around.");
                                          src_text("Salla:Fine, just don't touch anything.");
                                          break;
                                   
                                   //Swamp Interior NPC4
                                   case "Swamp_Interior_NPC4":
                                          src_text("Jurran:You move quiet... almost made me draw my blade.");
                                          src_text("Haru:Didn't mean to scare you.");
                                          src_text("Jurran:Just don't sneak around me again.");
                                          break;
                                   
         //---------------------------------NPCs FOR Act 3------------------------------------------------------------------------------------------//                          
                                    
                                    //Swamp Town NPC1
                                    case "Swamp_Town_NPC1":
                                        src_text("Rook:You look way too clean to be from around here.");
                                        src_text("Haru:Yeah, I just arrived.");
                                        src_text("Rook:Figures. Swamp'll dirty you up quick, don't worry.");
                                        src_text("Haru:I'll keep that in mind.");
                                        break;
                                    
                                    //Swamp Town NPC2
                                    case "Swamp_Town_NPC2":
                                        src_text("Vess:Huh... new face. Thought you were another lost.");
                                        src_text("Haru:No, I'm just looking around.");
                                        src_text("Vess:Good. Saves me from pointing someone back to the entrance again.");
                                        src_text("Haru:Thanks, I'll be careful.");
                                        break;
                                    
                                    //Swamp Town NPC3
                                    case "Swamp_Town_NPC3":
                                        src_text("Grint:Watch your step. Swamp eats shoes for breakfast.");
                                        src_text("Haru:Sounds unpleasant.");
                                        src_text("Grint:Unpleasant? Try losing three pairs in one week.");
                                        src_text("Haru:I'll try not to add to that count.");
                                        break;
                                    
                                    //Swamp Town NPC4
                                    case "Swamp_Town_NPC4":
                                        src_text("Salla:Great, another outsider. Hope you don't fall in like the last one.");
                                        src_text("Haru:I'll try not to.");
                                        src_text("Salla:Good, I'm not fishing anyone out today.");
                                        src_text("Haru:Fair enough.");
                                        break;
                                    
                                    //Swamp Town NPC5
                                    case "Swamp_Town_NPC5":
                                        src_text("Lorka:Whoa, calm down, almost thought you were sneaking up on me.");
                                        src_text("Haru:Sorry, didn't mean to.");
                                        src_text("Lorka:Relax, just messing with you.");
                                        src_text("Haru:Okay.");
                                        break;
                                    
                                    //Swamp Town NPC6
                                    case "Swamp_Town_NPC6":
                                        src_text("Nerrik:Lost? Outsiders always look lost.");
                                        src_text("Haru:No, I'm fine. I'm new here.");
                                        src_text("Nerrik:Ah. New is just the slow version of lost.");
                                        src_text("Haru:I'll try not to prove you right.");
                                        break;
                                    
         //---------------------------------NPCs FOR Act 4 Interiors--------------------------------------------------------------------------------//
                                   
                                   //Mountain Inn NPC
                                   case "Mountain_Inn_NPC1":
                                          src_text("Mark:If you need something, go check up front. They handle all that.");
                                          src_text("Haru:Thank you.");
                                          src_text("Mark:Anytime. Enjoy your stay here.");
                                          break;
                                   
         //---------------------------------NPCs FOR Act 4------------------------------------------------------------------------------------------//
                                    
                                    //Mountain Camp NPC1 (welcome)
                                    case "Mountain_Camp_NPC1":
                                        src_text("Garron:Hey there, welcome to the camp.");
                                        src_text("Haru:Thanks, just got here.");
                                        src_text("Enjoy your stay at the camp");
                                        break;
                                    
                                    //Mountain Camp NPC2 (welcome)
                                    case "Mountain_Camp_NPC2":
                                        src_text("Rema:Oh, new to the mountain?");
                                        src_text("Haru:Yeah, first time.");
                                        src_text("Rema:Then welcome. Hope you like the view.");
                                        src_text("Haru:It's nice so far.");
                                        break;
                                    
                                    //Mountain Camp NPC3 (welcome)
                                    case "Mountain_Camp_NPC3":
                                        src_text("Torren:Hey, you must be the newcomer.");
                                        src_text("Haru:Yeah.");
                                        src_text("Torren:Welcome. If you need anything, just ask.");
                                        src_text("I will and Thank you.");
                                        break;
                                    
                                    //Mountain Camp NPC4
                                    case "Mountain_Camp_NPC4":
                                        src_text("Varr:Hey. Need any help?");
                                        src_text("Haru:No, I'm good.");
                                        src_text("Varr:Alright, cool.");
                                        src_text("Haru:Thanks though.");
                                        break;
                                    
                                    //Mountain Camp NPC5
                                    case "Mountain_Camp_NPC5":
                                        src_text("Brol:Hey. Everything alright?");
                                        src_text("Haru:Yeah, all good.");
                                        src_text("Brol:Nice. Enjoy the mountain air.");
                                        src_text("Haru:Thanks.");
                                        break;
                                    
                                    //Mountain Camp NPC6
                                    case "Mountain_Camp_NPC6":
                                        src_text("Kyra:Hi. You need something?");
                                        src_text("Haru:No, I'm okay.");
                                        src_text("Kyra:Alright. Just checking.");
                                        src_text("Haru:Thanks.");
                                        break;
                                        
                  //------------------------------------------------------------------------------------------------------------------------------------------------------//                  
        
        case "npc 1":
        src_text("Mikeru:I am Mikeru The programmer of this game");
        src_text("Mikeru:Do you like the game?");
        src_option("Yeah", "npc 1 - Yeah");
        src_option("No", "npc 1 - No");
        break;
        
        
        case "npc 1 - Yeah":
            src_text("Mikeru:Ayyy thank you");
        
        break;
        
        case "npc 1 - No":
                    
                src_text("Mikeru:Man love you");
                src_text("Mikeru:Eat cake and live friend");
                src_text("Mikeru:You were born in the right format");
                src_text("Mikeru:I hope you liked your juice bestie");
                src_text("Mikeru:Everyone loves and cares about you bestie");
                src_text("Mikeru:You are a human resource to society");
                src_text("Mikeru:Give every single human being in this planet a favor and go improve your future");
                src_text("Mikeru:LOVE YOU");
                break;
        
        
        case "maya joined the party":
         src_text("Maya joined the journey");
         break;
        
        
        
        case "npc 2":
                    src_text("I am mark the sprite editor");
                    src_text("you like my work?");
                    src_option("Yeah", "npc 2 - Yeah");
                    src_option("Nope", "npc 2 - Nope");
                    
                break;
        
        
        case "npc 2 - Yeah":
            src_text("ayyyyyy");
            src_text("thanks")
        break;
        
        case "npc 2 - Nope":
            src_text("Aww");
            src_text("sdareafsdfs!");
            
                break;
        
        
        
        
        
        
        
        
        
        case "npc 3":
                src_text("Haru! how are you holding up to? No Maya today?");
                src_text("Haru:Thats exactly where I'm going");
                src_text("So bow down to me peasants")
                break;
        
        case "npc 4":
            src_text("Oh hi. So, how are you holding up? Because I'm a POTATO.");
            src_text("clap... clap... clap... Oh good, my slow clap processor made it into this thing, so we have that")
        break;
         
         
         case "npc 5" :
                  src_text("HEY. KID. YOU LIKE SOUP?");
                  src_text("Ive been simmering in this puddle for THREE DAYS, waiting for someone with SOUP POTENTIAL.");
                  src_option("Yes! I LOVE soup!", "npc 5 - Love soup");
                  src_option("Soup is... overrated.", "npc 5 - soup hater");
         
         break;
         
         case "npc 5 - Love soup":
                  src_text("YEAHHHH! I KNEW you had that brothy energy!");
                  src_text("Take this. My SOUP CERTIFICATION CARD. Its slightly soggy, but VALID IN SEVERAL DIMENSIONS.");
                  src_text("He gives you a damp card that says SOUP-FRIEND in crayon");
                  break;
         
         case "npc 5 - soup hater":
                  src_text("LE GASP");
                  src_text("YOU DARE DEFY THE BROTH GODS?");
                  src_text("BEGONE, DRY-TONGUED INFIDEL!");
                  break;
         
         case "Act 1 Shop keeper":
                  src_text("Do you wanna browse?");
                  break;
        
         
         case "Lucian lore":
                  src_text("There was a prophecy once inscribed by the 12 pillars of the world once.");
                  src_text("It goes like this. All shall bid farewell to one, and that person alone will witness the miracle.");
                  src_text("Such is the will of fate.");
                  break;
         
         
         case "Beta shop" :
                  src_text("Hello I am a shop keeper");
                  src_text("But as you can see, I am merely still a block.");
                  src_text("Why? because the Developers of this game hasn't have a sprite for me");
                  src_text("But thats not the point. The point is im here to waste your mone-")
                  src_text("I mean... sell you what you need."); 
                  src_text("Yeah thats right. Please, browse to your heart's content");
                  textbox_callback = function () {
                           instance_create_layer(0,0, "Instances", obj_shop);
                  }
                  //src_option("I'm done browsing", "Beta shop exit")
                  break;
         
         
         
         case "Beta shop exit":
                  src_text("Done browsing? I'll be here still with infinite stocks");
                  src_text("Why? because I am a beta shop");
                  src_text("Or you could say, beta block. Eh? Eh? Ahahaha... Yeah I am totally lonely")
                  break;
         
         
         case "Chest_1":
                  src_text("You found small potion");
                  src_text("small potion can be found in inventory");
                  break;
         
         case "Chest_2":
                  src_text("You found revive");
                  src_text("Revive can be found in inventory");
                  break;
         
         
         case "Lucian Statue":
                  src_text("His sword remians plunged into the earth, still faintly resonating with lunar energy");
                  src_text("A silent testament to the promise he once made and kept until the very end");
                  break;
         
         
         
         case "Forest save":
                  src_text("Reception lady:Welcome Travellers what can I help you today?");
                  src_option("Save", "Forest save Yes");
                  src_option("Rest-Heal 5G", "inn heal");
                  break;
                  
                  case "Forest save No":
                           src_text("Reception lady:Come back any time");
                           break;
                    
                    
                    case "inn heal":
                   var _inn_cost = 5; // <-- Set the inn price here

                   if (global.gold >= _inn_cost)
                   {
                           global.gold -= _inn_cost;  // Player pays

                           textbox_callback = function() {
                           for (var i = 0; i < array_length(global.party); i++) {
                           var p = global.party[i];
                           p.hp = p.hpmax;
                           p.mp = p.mpmax;
                            }
                             };

                           src_text("Reception lady:That will be " + string(_inn_cost) + " gold.");
                            src_text("Reception lady:All set! You're fully healed. Rest well!");

                                     }
                                              else
                                              {
                           src_text("Reception lady:I'm sorry but you don't have enough gold to stay.");
                            src_text("Reception lady:Come back when you have enough.");
                                     }

                                     break;
                  






                  
                  case "Forest save Yes":
                           src_text("Reception lady:Thank you have a good stay");
                           textbox_callback = function() {
                           save_game_json(); // <-- Call your save script here
    }
                           src_text("GAME SAVED");
                           break;
         
         
         
         //---------------------------------NPC FOR ACT 1------------------------------------------------------------------------------------------//
         
         
         
         
         
         
         
         case "NPC1":
                  src_text("Old Man Carl:Back in my day, monsters were polite! If one was gonna eat you, they'd at least bring a fork.");
                  break;
         
         
         
         
         
         case "NPC2":
                  src_text("Clueless NPC:I was programmed to give you helpful advice, but honestly? I forgot my lines.");
                  src_text("Clueless NPC:Just. good luck out there kid.");
                  break;
         
         case "NPC3":
                  src_text("Neru:Haru! its been a while, what are you up to? no Maya today?")
                  src_option("Duh! Thats exactly where I am going", "NPC3 response truthfully");
                  break;
         
         case "NPC3 response truthfully":
                  src_text("Neru:Of course you are, You two are unseperable since birth. Two peas in the same pod as the kids say");
                  src_text("Neru:Some even joked around that you'll rebel if you're not 5ft beside her.");
                  src_text("Neru:Anyway, Say Hi for me when you see her okay?");
                  src_text("Haru:Yeah yeah, see you around Neru");
                  src_text("Neru:Ha! see you around!")
                  break;
         
         
         case "NPC4":
                  
                  src_text("I FUCKING LOVE FRESH SEA BREEZE");
                  break;
         
         case "NPC5":
                  src_text("Haru:This is a test.");
                  src_text("Maya:This is another test.")
                  src_text("This is a test")
                  break;
         
         
         
         
         
         
         //---------------------------------for starting cutscene-----------------------------------------------//
         case "dialogue 1":
                  src_text("Grandpa:The lake's as still as ever.");
                  src_text("Grandpa:You know Haru, I used to come here every morning, back when my legs still had some fight in em");
                  src_text("Haru:Really gramps? Back when you were still an adventurer?");
                  src_text("Grandpa:Aye! Back then, I wasn't just any fisherman.");
                  src_text("Grandpa:I was Gran the gale, Slayer of beasts!");
                  src_text("Grandpa:Discoverer of hidden temples, and...");
                  src_text("Grandpa:Ocassional frog chaser.");
                  break;
         
         
         case "dialogue 2":
                  src_text("Haru:Frog chaser? That doesn't sound very heroic");
                  src_text("Grandpa:You'd be surprised how fast those things run with your lunch tied to 'em!");
                  break;
         
         case "dialogue 3":
                  src_text("Grandpa:But those were the good days... days when the world felt big, i feel like i could take on anything.");
                  src_text("Haru:I wanna be like that too someday. Brave enough to see the world, and help people like you did.");
                  src_text("Grandpa:Heh, then lets start by catching dinner first eh?")
                  break;
                  
         
                  case "dialogue 4":
                           src_text("Grandpa:Looks like you've got a bite there lad.");
                           src_text("Haru:Oh! i got something!");
                           break;
         
                  case "dialogue 5":
                           src_text("Haru:Its pulling hard!");
                           src_text("Haru:This guy is tough gramps!");
                           src_text("Grandpa:Easy, easy don't let it slip! keep the line steady!");
                           break;
         
                  case "dialogue 6":
                           src_text("Haru:Wha.")
                           src_text("Haru:WHAT ON EARTH IS THAT?!")
                           src_text("Grandpa:Haru! You reeled up slime! Of all the luck!");
                           src_text("Grandpa:Quick lad, don't just stare at it, show me what you've learned with that sword of yours!");
                           src_text("Haru:Right! I'll handle it.");
                           break;
         
                  case "dialogue 7":
                           src_text("Haru:That was tougher than it looked... Who knew fishing could be dangerous?");
                           src_text("Grandpa:Ha! You've got my kind of luck boy. I once fought a crab bigger than a cart after a fishing trip.");
                           src_text("Grandpa:Nearly lost my lunch and my rod.");
                           break;
         
         
                  case "dialogue 8":
                           src_text("Haru:Guess I'm just following in your footsteps then");
                           src_text("Grandpa:That's the spirit! but that reminds me.");
                           src_text("Grandpa:You promised that girl, Maya, you'd meet her at the shrine today right?");
                           src_text("Haru:...");
                           src_text("Grandpa:...")
                           src_text("Haru:OH CRAP! I ALMOST FORGOT!");
                           src_text("Haru:She'll scold if I'm late again.");
                           break
         
                           
                           case "dialogue 9":
                                    src_text("Haru:I'm off grmaps!")
                                    src_text("Grandpa:Then off you go, before it goes dusk. And don't worry.");
                                    src_text("Grandpa:I'll keep the lake from any more... fishy slimes.");
                                    src_text("Haru:Thanks grandpa I'll be back before dusk!")
                                    break
         
                           
         
         //---------------------------------------INTRO 1 END----------------------------------------------------------//
                           
         
         
         //
         
         case"scene 1 dialogue 1":
         src_text("Haru:Sorry I'm late Grandpa wanted to");
         break;
         
         
         
         case "scene 1 dialogue 2":
                  src_text("Maya:tell you another one of his 'back in my day' stories again?");
                  src_text("Maya:You promised you'd be here after lunch Haru.");
                  src_text("Haru:I know, I know! but it wasn't my fault! I, uh.");
                  src_text("Haru:Caught slime while fishing.");
                  break;
         
         
         
         
         
         
         
         case "scene 1 dialogue 3":
                  src_text("Maya:You what? You went fishing and caught a slime?");
                  src_text("Haru:I didn't mean to! It sort of, jumped out of the lake! Gramps almost fell off his chair!");
                  src_text("Maya:Only you Haru. You're hopeless.");
                  src_text("Hoho, young love and slime catching After lunch? Quite the adventurous noon hmm?");
                  break;
         
         
         
         
         
         
         case "scene 1 dialogue 4":
                  src_text("Maya:Elder! Its not like that!");
                  src_text("Haru:Yeah! Its not like that I mean, wait.");
                  break;
         
         case "scene 1 dialogue 5":
                  src_text("Haru:What do you mean?");
                  src_text("Elder Roi:Ah don't mind this old man. I just enjoy seeing the two of you together.");
                  src_text("Elder Roi:it reminds me of when I still had hair and courage.");
                  break;
         
         
         
         case "scene 1 dialogue 6":
                  src_text("Maya:You always say that Elder...");
                  src_text("Elder Roi:Indeed I do. But I didn't call you both here just to tease you.");
                  break;
         
         
         case "scene 1 dialogue 7":
                  src_text("Elder Roi:There's... been a occurance in the forest.");
                  src_text("Haru:Am occurance?");
                  src_text("Elder Roi:Yes The watchmen reported a landslide near the ridge's path. The strange thing is.")
                  src_text("Elder Roi:No rain, no tremor, no reason for it all to happen. I'd like the two of you to investigate.");
                  src_text("Elder Roi:Make sure no one's hurt and see if anything.. Unusual caused it.");
                  src_text("Maya:We understand Elder. We'll check it out right away");
                  break;
         
         
         
         case "scene 1 dialogue 8":
                  
                  src_text("Haru:Yeah! Leave it to us. If anyone's stuck under rocks, I'll just dig them out, Mission completed!");
                  src_text("Maya:That's not");
                  break;
         
         
         case "scene 1 dialogue 9":
                  src_text("Elder Roi:Thats the spirit. But do be careful, the forest hasn't felt quite right recently.");
                  src_text("Maya:We will elder. Come on now Haru, Lets move before it dusks.");
                  src_text("Haru:Onwards My fellow subordinate, we have a avalanche site to clear!");
                  break;
            
            
           
         
         
         
//---------------------------------------------END OF SCENE 1----------------------------------------------------------------------------------------------------------------------//         
         
         
         //start of act 1 scene 2
         
         
         case "scene 2 dialogue 1":
                  src_text("Maya:This must be where the avalanche happened.");
                  src_text("Haru:Yeah Its worse than I thought. No way anyone's getting through here for a while.");
                  break;
         
         
         case "scene 2 dialogue 2":
                  src_text("Merchant:Ah, great! Just great! My goods are on the other side.");
                  src_text("Merchant:And the road's sealed tighter than a crabshell!.")
                  break;
         
         case "scene 2 dialogue 3":
                  src_text("Haru:Hey are you alright sir? Were you here when it happened?");
                  src_text("Merchant:Huh? Oh, yeah, I'm fine. Thanks to my legs and a bit of luck!");
                  break;
         
         case "scene 2 dialogue 4":
                  src_text("Merchant:But I nearly wasn't. The ground started shaking outta nowhere!");
                  src_text("Merchant:Like the whole forest took a deep breath before coughing up half the mountain!");
                  src_text("Merchant:If I hadn't jumped back, I'd be flatter than my old mule!");
                  break;
                  
         
         case "scene 2 dialogue 5":
                  src_text("Maya:So there was an landslide? The Elder said there weren't any tremors reported.");
                  src_text("Merchant:Aye, it didn't feel like any normal landslide missy.");
                  break;
         
         case "scene 2 dialogue 6":
                  src_text("Merchant:Right before it happened, I heared this deep rumble. Not from the ground.");
                  src_text("Merchant:From inside that cave over there.");
                  break;
         
         
         case "scene 2 dialogue 7":
                  src_text("Haru:A cave? You think something inside caused this?");
                  src_text("Merchant:I don't know what's down there, and I don't wanna know.");
                  src_text("Merchant:Just be careful.. Whatever made that noise isn't something a pickaxe could scare off.");
                  break;
         
         
         
         case "scene 2 dialogue 8" :
                  src_text("Guard:We'll start clearing the path, but it'll take hours. The ground's too unstable to move quickly.");
                  src_text("Maya:Then we should investigate the cave first. If something inside have caused this.");
                  src_text("Maya:There will be more danger ahead.");
                  break;
         
         case "scene 2 dialogue 9":
                  src_text("Haru:Right. We'll check it out and come back once we know what's going on.");
                  src_text("Merchant:You kids are braver than most.");
                  break;
         
         
         case "scene 2 ending dialogue":
                  src_text("Maya:Alright Haru, lets see what's inside this cave.");
                  src_text("Haru:Alright let's find out what's really going on.");
                  break;
         
         
         
 //---------------------------------------END OF SCENE 2------------------------------------------------------------//        
         
         
         
         
         //start of scene 3 boss
         
         case "scene 3 dialogue 1":
                  src_text("Haru:Finally I was starting to think this maze would never end.");
                  src_text("Maya:Wait... something's blocking the path.");
                  src_text("Haru:Huh? looks like a rock?");
                  break
         
         //maya faces to ruin titan and haru jumps
         
         case "scene 3 dialogue 2":
                  src_text("Haru:That looks too shiny to be a rock.");
                  src_text("Maya:It's metal... and big. Almost like a statue.");
                  break;
         
         //haru moves closer
         
         case "scene 3 dialogue 3":
                  src_text("Haru:Whoa. Is that a robot here?");
                  src_text("Haru:Guess someone's old junk got lost down here.");
                  break;
                  
         //maya moves closer
         
         case "scene 3 dialogue 4":
                  src_text("Maya:I've never seen anything like it. The craftsmanship looks ancient, but advanced.");
                  src_text("Haru:Maybe it's some kind of mining machine?");
                  break;
         
         //haru taps it multiple times
         
         case "scene 3 dialogue 5":
                  src_text("Haru:Hey buckethead, you still work?!");
                  src_text("Maya:Haru don't!");
                  break;
         
         //ruin titan turns on and haru and maya backs off
         
         case "scene 3 boss start":
                  src_text("Haru:Uh oh. That's... Not good.");
                  src_text("Maya:You think?! Get back?!");
                  break;
         
         //after boss
         
         case "scene 3 dialogue 6":
                  src_text("Haru:Okay... Remind me not to mock a giant metal thing again.");
                  src_text("Maya:I.. I thought we were done for. One wrong move and");
                  src_text("Haru:Hey.. we made it out right? Barely.. but still breathing.");
                  break;
         
                  //Haru walks away to the exit, Maya notices something         
         case "scene 3 dialogue 7":
                  src_text("Maya:Wait something fell from it.");
                  src_text("Maya:These symbols... They're ancient I've read something like this in Elder's books.");
                  break;
         //haru turns back
         case "scene 3 dialogue 8":
                  src_text("Haru:Whatever they are, we shouldn't touch them. Lets head back and.");
                  break;
         
         //maya passes out
         case "scene 3 dialogue 9":
                  src_text("Haru:Maya!");
                  break;
         
         case "scene 3 dialogue 10":
                  src_text("Haru:A mark, what is this? Its glowing? What the heck happened?");
                  break;
                  
         
         //haru start to pass out
         case "scene 3 ending":
                  src_text("Haru:Maya...");
                  src_text("Haru:Maya.. Get up.");
                  break;
         
         //haru passes out
         
         
         
         case "developer demo end":
                  src_text("Hello this is the developer here. You have finally reached the end of this demo");
                  src_text("I am sorry if its too rushed, a cliffhanger, or too small and thats because it was only 2 guys programmed this whole thing");
                  src_text("This took too much time sweat and tears making these so any feedback is recomended thank you");
                  src_text("if you still wanna play, you just exit this house and go explore the rooms or defeat any monsters");
                  src_text("Again thank you for playing, ~Mikeru")
                  break;
                  
         
         
         
         case "scene 4 dialogue 1":
                  src_text("Haru:Ngh...");
                  src_text("Haru:Where am I?");
                  src_text("Grandpa:Easy there lad. Don't rush it. You've been out for 2 days.");
                  break
         
         //grandpa goes to haru
         
         case "scene 4 dialogue 2":
                  src_text("Haru:Grandpa? What? Happened?")
                  src_text("Grandpa:You tell me boy. One moment you and Maya went off to check that avalanche.");
                  src_text("Grandpa:Next thing I know, a guard's carrying you back half dead, and covered with dust.");
                  src_text("Grandpa:You gave this old man a fright I haven't felt in years.");
                  src_text("Haru:Two.. Days?.. Wait.");
                  break
         
         //Haru stood up panicked
         
         
         case "scene 4 dialogue 3":
                  src_text("Haru:Maya! Where is she?! Is she still alright?!");
                  src_text("Grandpa:Still worrying about others before yourself I see");
                  src_text("Grandpa:Don't fret, She's safe. Woke up before you did");
                  src_text("Haru:Thank the stars...");
                  src_text("Grandpa:Aye. She's been at the shrine since yesterday.");
                  src_text("Grandpa:The elder is keeping an eye on her");
                  src_text("Grandpa:Said she wanted some time alone to think");
                  break;
                  
                  //haru stands
         case "scene 4 dialogue 4":
                  src_text("Haru:Then I have to go see her");
                  break;
         
         //grandpa stopped him
         case"scene 4 dialogue 5":
                  src_text("Grandpa:Not yet lad");
                  break;
         
         //haru turns to grandpa set time to 0.7
         case "scene 4 dialogue 6":
                  src_text("Grandpa:There's something you need to hear first. Something I should've told you a long time ago");
                  src_text("Haru:What do you mean?");
                  src_text("Grandpa:What happened..");
                  break;
         
         
         //small pause
         case "scene 4 dialogue 7":
                  src_text("Grandpa:What happened in that cave, it wasn't just an accident");
                  src_text("Grandpa:There's a reason why you and Maya both carry those marks");
                  src_text("Grandpa:A secret...Your parents and I have kept hidden since the day you were born");
                  break;
         
         
                  case "scene 4 dialogue 8":
                           src_text("Haru:A secret?");
                           src_text("Grandpa:Aye. And its time you know the truth");
                           src_text("Haru:Gramps what do you mean? What secret?");
                           break
                  
                  
                  //grandpa turns around and pauses for 0.5 sec
                  case "scene 4 dialogue 9":
                           src_text("Grandpa:When you were born, you carried a special mark on your neck.");
                           src_text("Grandpa:A golden outline tracing the symbol of the sun, just like your mother's");
                           src_text("Haru:The one that glows sometimes?");
                           break;
                  
                  //grandpa faces back haru but without a sprite, wait 0.5 secs as placeholder
                  case "scene 4 dialogue 10":
                           src_text("Grandpa:Aye. They're not ordinary birthmarks, Haru.");
                           src_text("Grandpa:They're gifts, or curses depending on who you asked");
                           src_text("Grandpa:No one truly knows their meaning, but they were passed down for generations");
                           src_text("Haru:Then... What do they do? What are they for?");
                           break;
                  
                  //grandpa backs a little then continue
                  case "scene 4 dialogue 11":
                           src_text("Grandpa:I wish I knew lad, Your parents beleived that the marks were tied to something ancient");
                           src_text("Grandpa:Something beyond this world. That's why they left on their journey. TO find answers");
                           src_text("Haru:My parents, you said that they never came back when I was little. What happened to them?");
                           src_text("Grandpa:Your father... didn't make it back. The journey took him before his time");
                           src_text("Grandpa:As for your mother... She vanished. No word, no trace, only silence");
                           break;
                           
                  //pause for haru to take all this. 1 sec
                  case "scene 4 dialogue 12":
                           src_text("Haru:You knew all this... and never told me?");
                           src_text("Grandpa:Because I wanted to protect you");
                           src_text("Grandpa:The world beyond isn't kind, Haru. And whatever truth your parent sought");
                           src_text("Grandpa:It wasn't meant to be found easily");
                           src_text("Haru:But if they were looking for answers about the marks, then maybe");
                           src_text("Grandpa:No lad. You're not ready for that path. Not yet");
                           break
                           
                  
                  //grandpa faces haru again but no sprite, set 0.5 wait time
                  case "scene 4 dialogue 13":
                           src_text("Grandpa:Your mother and father were strong, stronger than I was");
                           src_text("Grandpa:But even they couldn't outrun the weight of what they carried");
                           break;         
                  
                  // wait 0.5
                  case "scene 4 dialogue 14":
                           src_text("Haru:Then why do we have these marks? Why Maya and me?");
                           src_text("Grandpa:That I can't answer");
                           src_text("Grandpa:But I do know this. Those marks will call out to you and when they do.");
                           src_text("Grandpa:You'll have to decide whether to follow or turn away");
                           break;
                  
                  
                  
                  
                  case "scene 4 dialogue 15":
                           src_text("Haru:I don't wanna lose anyone else");
                           src_text("Grandpa:Then hold on to those you can still protect boy");
                           src_text("Grandpa:Thats what your father tried to do... until the very end");
                           src_text("Grandpa:I'll be here until you made up your mind but before that");
                           src_text("Grandpa:Go check on Maya, She's been checking you for two days");
                           src_text("Grandpa:Its best to let you see you're alright");
                           break;
                  
                           
                  
                  
                  
                  //-----------------------------------------scene 5------------------------------------------------------// 
                  
                  
                  case "scene 5 dialogue starter":
                           src_text("Haru:Gramps said Maya's at the shrine. I shouldn't keep her waiting for too long");
                           break;
                  
                  
                  
                  //maya and elder talking maya then faces to haru
                  case "scene 5 dialogue 1":
                           src_text("Maya:Haru..");
                           break;
                  
                  // Maya checks up on Haru
                  
                  case "scene 5 dialogue 2":
                           src_text("Maya:Thank god you're awake. You've been out for 2 days, I thought I lost you");
                           src_text("Haru:Two days?... I should be the one worrying, you were knocked right in front of me");
                           src_text("Haru:How are you right now?");
                           src_text("Maya:I'm fine now. Just... Glad we make it back");
                           break;
                  
                  //wait for 0.8 seconds
                  
                  
                  case "scene 5 dialogue 3":
                           src_text("Maya:When I examined that fragment, I saw a lot of visions that I couldn't understand");
                           src_text("Maya:Like, all of this was meant to happened. The avalanche, that robot, the fragment");
                           src_text("Haru:What do you mean?");
                           break;
                  
                  
                  //elder chimes in
                  
                  
                  
                  
                  case "scene 5 dialogue 4":
                           src_text("Elder Roi:We'll have time for that later. For now, tell me everything you saw");
                          
                           break;
                  
                  //1 sec wait
                  case "scene 5 dialogue 5":
                           src_text("Maya:We found this... ancient relic. It reacted when I held it")
                           src_text("Elder Roi:By the gods. This is no mere relic. The machine that guarded it");
                           src_text("Elder Roi:That was once our protector. It kept the Withering from entering the forest");
                           src_text("Elder Roi:If its infected, then the Wither will spread faster than before");
                           src_text("Haru:So what can we do?")
                           break;
                  
                  
                  // elder faces and walks at the shore of the shrine
                  case "scene 5 dialogue 6":
                           src_text("Elder Roi:There is an old tale.. Sol and Luna, gods who faced the beast of calamity,");
                           src_text("Elder Roi:When they clashed, their power scarred the world. That scar became the Withering");
                           src_text("Elder Roi:The very thing that eats away life. But legend speaks of one hope. The everbloom tree");
                           src_text("Elder Roi:Its petals is said can cleanse all Withering or any corruption that plague of this world");
                           break;
                  
                  
                  // maya follows elder
                  case "scene 5 dialogue 7":
                           src_text("Maya:The Everbloom... does it really exist?");
                           src_text("Elder Roi:It blooms once every hundred years. And the path to it is lost");
                           src_text("Haru:So we're meant to find them");
                           src_text("Elder Roi:Perhaps. But understand this");
                           break;
                  
                  
                  
                  
                  
                  case "scene 5 dialogue 8":
                           src_text("Elder Roi:This journey will demand everything from the both of you");
                           src_text("Elder Roi:Life, Safety, even peace of heart... You may not survive on the dangers ahead");
                           src_text("Elder Roi:But if you still wish to go... I will not stop you");
                           break;
                  
                  
                  
                  //1 second break
                  case "scene 5 dialogue 9":
                           src_text("Haru:If what you said is true... then sitting here won't save anyone. Not the village, not anyone else");
                           src_text("Maya:I'm scared Haru. What happened in that cave... the Withering feels so much bigger than us");
                           src_text("Haru:Yeah me too. But if we don't go, who will?")
                           break;
                  
                  
                  //Maya faces haru
                  case "scene 5 dialogue 10":
                           src_text("Maya:Then lets see it through. For the village");
                           src_text("Maya:No. For this world we truly love");
                           break;
                           
                           case "scene 5 dialogue 11":
                                    src_text("Elder Roi:Looks like you made up your mind.");
                                    src_text("Elder Roi:Then may the light of Sol and Luna guide your paths");
                                    src_text("Elder Roi:And before I forget, here have this");
                                    src_text("You have obtained Rune fragments");
                                    src_text("Press 'C' to access runes in menu");
                                    src_text("Haru:What are these elder?");
                                    src_text("Elder Roi:Shards of old runes once used by the guardians of this land.");
                                    src_text("Elder Roi:They won't unlock any miracles, but they will strengthen your abilities.");
                                    src_text("Elder Roi:Think of them as a small edgeone you'll need for the trials ahead.");
                                    src_text("Maya:Even a small advantage can save us. Thank you, Elder.");
                                    src_text("Elder Roi:Go now. Time is no longer our ally.");
                                    
                                    break;
                                    //end of scene 5
                                    
                  
                           
                           
                                    
         //-----------------------------START OF ACT 2------------------------------------------------------------------------------------------------------------//
                           
                           
                                    
                                    
                                    //airy introduction scene before village
                                    case "scene 6 dialogue 1":
                                             src_text("???:AAAAAH");
                                             src_text("???:HELP SOMEBODY PLEASE!");
                                             break;
                                    
                                    
                                    //maya darts ahead
                                    case "scene 6 dialogue 2":
                                             src_text("Maya:Did you hear that?");
                                             src_text("Haru:Yeah it sounded close. Come on!");
                                             break;
                                    
                                    //resume player control and move forward
                                    
                                    case "scene 6 dialogue 3":
                                             src_text("???:EEK! GET IT OFF GET IT OFF ITS SO SLIMY!");
                                             src_text("Haru:Hang on we got you!");
                                             src_text("Maya:That slime's infected... Stay back Haru, its leaking wither!");
                                             src_text("Haru:Then we'll finish this quick");
                                             break; //enter combat
                                    
                                    
                                    case "scene 6 dialogue 4":
                                             src_text("???:Ugh... gross! Do you know how long it'll take me to get this out of my wings?");
                                             src_text("Haru:You're welcome, by the way");
                                             src_text("???:Oh! right thank you! Both of you!");
                                             src_text("???:I swear, that thing came out no where! If you hadn't showed up, I'd be fairy pudding!");
                                             src_text("Maya:You're a fairy?");
                                             break;
                                    
                                    //airy bounce proudly
                                    case "scene 6 dialogue 5":
                                             src_text("Airy:Mhm! Airy! at your service, spirit guide extraordinaire!");
                                             src_text("Airy:And who might you two be, oh mighty slime slayers?");
                                             break;
                                    
                                    case "scene 6 dialogue 6":
                                             src_text("Haru:I'm Haru. This is Maya. We were just passing through on our way to the plains");
                                             src_text("Airy:Maya, Haru... Nice names!");
                                             src_text("Airy:Well, fate clearly wanted us to meet so, I'll repay you!")
                                             break;
                                    
                                    //airy goes forward
                                    case "scene 6 dialogue 7":
                                             src_text("Airy:There's a village not far from here named Steppe ridge");
                                             src_text("Airy:You look like you could use a warm meal and a soft bed");
                                             src_text("Maya:A village sounds... perfect");
                                             break;
                                    
                                    
                                    case "scene 6 dialogue 8":
                                             src_text("Maya:We should rest before heading any farther");
                                             src_text("Haru:Alright then, lead the way Airy. But no more surprises okay?")
                                             break;
                                    
                                    
                                    //airy bounce
                                    case "scene 6 dialogue 9":
                                             src_text("Airy:Hehe, No promises!");
                                             break; //airy goes on ahead then player controls unlocked
                                             
                                             
                                             case "npc airy":
                                                      src_text("Airy:Just follow this path and you'll be in Steppe Ridge village!");
                                                      src_text("AiryCozy little place that smells like bread, grass, and slightly old humans!");
                                                      src_text("Airy:There is one, teensy problem")
                                                      src_text("Haru:What kind of 'tiny' are we talking about?");
                                                      src_text("Airy:Well... ever since the Withering started spreading.");
                                                      src_text("Airy:humans haven't exactly been thrilled to see 'non-humans' wandering around.");
                                                      src_text("Airy:Creatures like me fairies, spirits, even sprites are kind of... banned from entering most villages.");
                                                      break;
                                             
                                             
                                             
                                             
                    //------------------------------------------------------------SCENE 7 START-----------------------------------------------------------------------------------------------------------------------------//                       
                                             
                                             
                                             
                                             
                                             case "scene 7 dialogue 1":
                                                      src_text("Airy:Wait i feel something ahead");
                                                      src_text("Airy:There's a strong presence inside that castle");
                                                      src_text("Airy:We should move carefully. Something is watching us");
                                                      src_text("Haru:Got it. We'll stay alert");
                                                      src_text("Maya:No turning back now");  
                                                      break;
                                                
                                                
                                                case "scene 7 dialogue 2":
                                                    src_text("Lucian:So.. you've finally arrived");
                                                    src_text("Lucian:The moon's light chose poorly. You will go no further");
                                                    src_text("Haru:We're not here to fight you. Move aside!");
                                                    src_text("Lucian:If you wish to reach the truth, then prove your strength");
                                                    src_text("Lucian:Come! Let the moon judge you!");
                                                    break;
                                             
                                                case"scene 7 dialogue 3":
                                                    src_text("Lucian:Impressive... The moon was right about you");
                                                    src_text("Lucian:Take this fragment. It no longer belongs to me");
                                                    src_text("Haru:You're... giving it to us?");
                                                    break;
                   
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                                     // ⬤ Try one QUEST 1  START
        //Intro Talk                                
   case "main_giver_intro":
       src_text("Emman: Hey, Haru... Im glad youre here.");
       src_text("Emman: Something important went missing today.");
       src_text("Emman: Its a small card my Developers Debit Card.");
       src_text("Emman: Without it, I cant buy materials to keep the village running.");
       src_text("Emman: I think someone dropped it somewhere outside town...");
       src_text("Emman: Can you help me find it, please?");
       src_option("Yes, Ill help.", "side_quest_0_accept");
       src_option("No, sorry.", "side_quest_0_decline");
   break;
   
        //accept Quest
   case "side_quest_0_accept":
       src_text("Emman: Thank you so much! I knew I could count on you.");
       src_text("Emman: Try asking around first maybe someone saw it.");
       src_text("Emman: The receiver guy in the marketplace always sees everything.");
       src_text("Emman: Start with him. He might know where it fell.");
       global.side_quest_0_requested = true; 
   break;
   
        // QUEST DIALOGUe
case "side_quest_0_progress":
    src_text("Emman: Still searching?");
    src_text("Emmman: Someone said they saw a chest near the forest path.");
    src_text("Emman: Youre on the right track dont give up.");
break;

        //quest not accepted
   case "side_quest_0_decline":
       src_text("Emman: Oh, thats disappointing.");
       src_text("Emman: But I understand. Maybe youre busy.");
       src_text("Emman: If you change your mind, Ill be right here.");
   break;
   
        //Quest Complete
   case "side_quest_0_complete_dialogue":
       src_text("Emman: You actually found it?");
       src_text("Emman: Thats incredible!");
       src_text("Emman: You saved me from a huge amount of trouble.");
       src_text("Emman: I cant thank you enough.");
       src_text("Emman: Here take this reward. You earned it.");
   break;
        // After Quest Complete  NPC idle dialogue
    case "side_quest_0_after":
    src_text("Emman: Thanks again for helping me out.");
    src_text("Emman: The village is running smoothly because of you!");
    src_text("Emman: If you ever need anything, feel free to stop by.");
    break;

   

// SIDE QUEST 1  Lost Beekeeper's Jar

// Intro
case "side_quest_1_intro":
    src_text("Town Drunk Dave: H-Hey kid... hic...");
    src_text("Town Drunk Dave: I think I lost my Beekeeper's jar again...");
    src_text("Town Drunk Dave: It's somewhere around the houses.");
    src_text("Town Drunk Dave: Can ya... hic... find it for me?");
    src_option("Yeah, I'll help.", "side1_accept");
    src_option("No thanks.", "side1_decline");
break;

// Accept
case "side1_accept":
    src_text("Town Drunk Dave: You're a lifesaver... hic!");
    src_text("Town Drunk Dave: It should be in one of the houses...");
    src_text("Town Drunk Dave: I... hic... lose it all the time...");
    global.side_quest_1_requested = true;
break;

// Decline
case "side1_decline":
    src_text("Town Drunk Dave: Hic... alright... maybe later then...");
break;

// Mid-quest
case "side_quest_1_progress":
    src_text("Town Drunk Dave: Still lookin'?");
    src_text("Town Drunk Dave: Try the front of Jerstine's shop... hic...");
    src_text("Town Drunk Dave: I always lose it around there...");
break;

// Completion dialogue
case "side_quest_1_complete_dialogue":
    src_text("Town Drunk Dave: My jar!!!");
    src_text("Town Drunk Dave: You actually found it!");
    src_text("Town Drunk Dave: Thank you! hic!");
    src_text("Town Drunk Dave: Here's 100 Gold...");
break;

// After quest
case "side_quest_1_after":
    src_text("Town Drunk Dave: Hic... thanks again for finding my jar kid.");
    src_text("Town Drunk Dave: You're always welcome here... hic!");
break;



// SIDE QUEST 2  Herbalist Lysa
case "side_quest_2_intro":
    src_text("Lysa: Oh, traveler... I need your help.");
    src_text("Lysa: I'm missing a rare Fern Sample for my mixes.");
    src_text("Lysa: It grows near the river, past the first turn in Area 1-3.");
    src_option("I'll get it.", "side_quest_2_accept");
    src_option("Not right now.", "side_quest_2_decline");
break;

case "side_quest_2_accept":
    src_text("Lysa: Thank you. Please be careful...");
    src_text("Lysa: Country bandits roam that area.");
    global.side_quest_2_requested = true;
break;

case "side_quest_2_decline":
    src_text("Lysa: I see... Come back if you change your mind.");
break;

case "side_quest_2_progress":
    src_text("Lysa: Still searching?");
    src_text("Lysa: The fern grows near the river, past the first turn.");
break;

case "side_quest_2_complete_dialogue":
    src_text("Lysa: You found it!");
    src_text("Lysa: This fern is perfect!");
    src_text("Lysa: Please take these  they will serve you well.");
break;

case "side_quest_2_after":
    src_text("Lysa: Thank you again, traveler.");
    src_text("Lysa: Your help was invaluable.");
break;

         // SIDE QUEST 3  Caravan Driver Hanko
case "side_quest_3_intro":
    src_text("Hanko: Hey there, traveler!");
    src_text("Hanko: One of my parcels fell off the cart while I was coming through the meadow.");
    src_text("Hanko: It's wrapped in cloth  pretty hard to miss.");
    src_text("Hanko: Could you help me retrieve it?");
    src_option("Sure, I'll get it.", "side_quest_3_accept");
    src_option("Not right now.", "side_quest_3_decline");
break;

case "side_quest_3_accept":
    src_text("Hanko: Thank you! You're doing a great service.");
    src_text("Hanko: Head down from the village into the meadow.");
    src_text("Hanko: Watch out  Purple Slimes and Footman soldiers roam the area.");
    global.side_quest_3_requested = true;
break;

case "side_quest_3_decline":
    src_text("Hanko: Ah, I see. Come back if you change your mind.");
break;

case "side_quest_3_progress":
    src_text("Hanko: Still searching?");
    src_text("Hanko: The parcel should be down the path heading into the meadow.");
    src_text("Hanko: Stay alert  the slimes like to hide in the tall grass.");
break;

case "side_quest_3_complete_dialogue":
    src_text("Hanko: You found it!");
    src_text("Hanko: The merchant will be relieved to get this back.");
    src_text("Hanko: Here  take this as payment. Thank you!");
break;

case "side_quest_3_after":
    src_text("Hanko: Thanks again for bringing that parcel back.");
    src_text("Hanko: Safe travels, friend!");
break;

// SIDE QUEST 4  Herder's Flute (Nira)
case "side_quest_4_intro":
    src_text("Nira: Oh... hello there.");
    src_text("Nira: During the escape yesterday, my wooden flute got snagged...");
    src_text("Nira: It must've fallen somewhere along the trail.");
    src_text("Nira: Without it, I can't guide the herd properly.");
    src_option("I'll retrieve it.", "side_quest_4_accept");
    src_option("Not now.", "side_quest_4_decline");
break;

case "side_quest_4_accept":
    src_text("Nira: Thank you. That flute means a lot to me.");
    src_text("Nira: Please check the trail carefully.");
    src_text("Nira: Be cautiousRed Slimes and Wraiths tend to drift around that area.");
    global.side_quest_4_requested = true;
break;

case "side_quest_4_decline":
    src_text("Nira: I understand... Let me know if you change your mind.");
break;

case "side_quest_4_progress":
    src_text("Nira: Did you find it?");
    src_text("Nira: It must be somewhere along the trail.");
    src_text("Nira: Watch your step... the Wraiths appear when you least expect it.");
break;

case "side_quest_4_complete_dialogue":
    src_text("Nira: My flute!");
    src_text("Nira: You truly found it... Thank you so much.");
    src_text("Nira: Please accept this reward. The herd is safe thanks to you.");
break;

case "side_quest_4_after":
    src_text("Nira: Thank you again for helping me.");
    src_text("Nira: I can finally guide the herd with peace of mind.");
break;

       // SIDE QUEST 5  Old Man Neher's Dying Wish
case "side_quest_5_intro":
    src_text("Neher: H-Hello... young one.");
    src_text("Neher: I have a final wish... before my time comes.");
    src_text("Neher: My wife... she was buried in the cemetery, Area 3.");
    src_text("Neher: Her ring was lost during the burial...");
    src_text("Neher: Could you retrieve it for me?");
    src_option("I'll get it for you.", "side_quest_5_accept");
    src_option("I'm sorry... not right now.", "side_quest_5_decline");
break;

case "side_quest_5_accept":
    src_text("Neher: Thank you... truly.");
    src_text("Neher: The ring should be somewhere in Area 3 of the cemetery.");
    src_text("Neher: But beware... Wraiths and Eclipse Sprites wander that place.");
    global.side_quest_5_requested = true;
break;

case "side_quest_5_decline":
    src_text("Neher: I understand...");
    src_text("Neher: If you find the strength, please come back.");
break;

case "side_quest_5_progress":
    src_text("Neher: Still looking?");
    src_text("Neher: The ring must be somewhere in the cemetery... Area 3.");
    src_text("Neher: Please... be careful.");
break;

case "side_quest_5_complete_dialogue":
    src_text("Neher: Y-You found it...?");
    src_text("Neher: Her ring... After so many years...");
    src_text("Neher: Thank you... You have given an old man peace.");
    src_text("Neher: Please accept this... It is all I can offer.");
break;

case "side_quest_5_after":
    src_text("Neher: Thank you again... young one.");
    src_text("Neher: My heart can rest now.");
break;
        

// SIDE QUEST 6  Captain Maxim's Edge
case "side_quest_6_intro":
    src_text("Captain Maxim: Soldier  a moment, if you will.");
    src_text("Captain Maxim: During our retreat through the mountain pass, I dropped my blade.");
    src_text("Captain Maxim: That sword has served me for years... I must have it back.");
    src_text("Captain Maxim: It should still be in the first area of Act 4.");
    src_option("I'll retrieve it, Captain.", "side_quest_6_accept");
    src_option("Not right now.", "side_quest_6_decline");
break;

case "side_quest_6_accept":
    src_text("Captain Maxim: Excellent.");
    src_text("Captain Maxim: Be cautious  the corrupted knights and those damned wraith commanders still roam there.");
    src_text("Captain Maxim: Return swiftly once you've secured the blade.");
    global.side_quest_6_requested = true;
break;

case "side_quest_6_decline":
    src_text("Captain Maxim: Very well... return if you change your mind.");
break;

case "side_quest_6_progress":
    src_text("Captain Maxim: Still searching?");
    src_text("Captain Maxim: That blade should be in the first area of Act 4, near the mountain path.");
    src_text("Captain Maxim: Stay sharp  the corrupted forces patrol heavily there.");
break;

case "side_quest_6_complete_dialogue":
    src_text("Captain Maxim: You found it!");
    src_text("Captain Maxim: My blade... finely done, soldier.");
    src_text("Captain Maxim: Take this reward  and my thanks.");
break;

case "side_quest_6_after":
    src_text("Captain Maxim: Good work out there.");
    src_text("Captain Maxim: With my blade returned, we stand one step stronger.");
break;
                 


// SIDE QUEST 7  Commander Eld's Lost Flag
case "side_quest_7_intro":
    src_text("Commander Eld: You there  a moment of your time.");
    src_text("Commander Eld: During the chaos in Act 4, Area 3... I dropped something important.");
    src_text("Commander Eld: My old Command Flag  the symbol of my unit.");
    src_text("Commander Eld: It must not fall into corrupted hands. Retrieve it for me.");
    src_option("I'll retrieve it, Commander.", "side_quest_7_accept");
    src_option("Not right now.", "side_quest_7_decline");
break;

case "side_quest_7_accept":
    src_text("Commander Eld: Good. I expected nothing less.");
    src_text("Commander Eld: Act 4, Area 3 is crawling with corrupted knights and wraith commanders.");
    src_text("Commander Eld: Recover the flag and bring it straight back to me.");
    global.side_quest_7_requested = true;
break;

case "side_quest_7_decline":
    src_text("Commander Eld: Hmph... Very well. Return when you are ready.");
break;

case "side_quest_7_progress":
    src_text("Commander Eld: Still searching?");
    src_text("Commander Eld: The command flag should be in Act 4  Area 3.");
    src_text("Commander Eld: Stay sharp. The corrupted commanders are relentless.");
break;

case "side_quest_7_complete_dialogue":
    src_text("Commander Eld: You have it... The Command Flag.");
    src_text("Commander Eld: With this, my unit's honor remains intact.");
    src_text("Commander Eld: You've done a great service. Take this reward.");
break;

case "side_quest_7_after":
    src_text("Commander Eld: Your assistance was invaluable.");
    src_text("Commander Eld: My unit will not forget your loyalty.");
break;

                                    


case "cave treasure room":
    src_text("You found Large potion!")
    src_text("You stored Large potion in your inventory");
    break;



case "scene 9 dialogue 1":
    src_text("Airy:Hey, you two, check this out. Fresh footprints. Someone passed through here recently.");
 
    break;

//airy bounce

case "scene 9 dialogue 2":
    src_text("Haru:In a place like this? Who would even come here?");
    src_text("Airy:There's a small shelter not far from here. Travelers used it back when this route was still safe.");
    src_text("Airy:We can head there, rest up, maybe grab a few supplies.");
    src_text("Maya:A shelter sounds... really nice right now.")
    src_text("Airy:Then let's hurry before the fog gets any thicker. It's just ahead!");
    //src_text("Maya:Let's move carefully. This village hasn't been safe for a long time")
    break;




case "scene 10 dialogue 1" :
    src_text("???:Turn back");
    src_text("???:Turn back... Or join the forgotten");
    break;


case "scene 10 dialogue 2":
    src_text("Dusk Reaper:You trespass upon a grave of despair.");
    src_text("Dusk Reaper:These souls fled in fear... and now they kneel in silence.");
    src_text("Dusk Reaper:You will join them.")
    break;

// wait 0.8
case "scene 10 dialogue 3": //'
    src_text("Maya:We're here to free them! Not fight them!");
    src_text("Dusk Reaper:Hope is a lie. Despair... is truth.");
    src_text("Haru:Then we'll break your truth, right here!");
    break;
    

//wait 0.8
case "scene 10 dialogue 4":
    src_text("Dusk Reaper:Come children of light. Let your souls fade");
    src_text("Dusk Reaper:And time let your names forgotten");
    break;


case "scene 10 dialogue 5":
    src_text("Dusk Reaper:...At last... they can rest...");
    break;

case "scene 10 dialogue 6":
    src_text("Maya:The voices... they're gone.");
    src_text("Haru:We freed them.");
    break;



case "scene 10 dialogue 7":
    src_text("Maya:Let's go. We got all 3 fragments. Next up, the mountain");
    src_text("Haru:Yeah the end is close");
    src_text("Maya:Then lets get going");
    break;




//ACT 4 GODDAMN FUCKING FINALLY HOLY FUCKING SHIT
case "scene 11 dialogue 1":
         src_text("Haru:So this is Everbloom Mountain... the last stretch");
         src_text("Maya:Yeah. Hard to believe how far we've come.");
         src_text("Maya:From that cave... to Lucian... the Ruin Titan... the Withered beasts...");
         src_text("Maya:Even the Dusk Reaper. And now we have every fragment.")
         break;

//airy shows up

case "scene 11 dialogue 2":
         src_text("Airy:And I still can't believe you two survived all that before I even met you.");
         src_text("Airy:If those stories are true, I should've brought extra backup!");
         src_text("Haru:We made it because we kept moving forward. Together.")
         break;
         
         // maya faces haru
         
         case "scene 11 dialogue 3":
                  src_text("Maya:And because you've changed, Haru.");
                  src_text("Maya:You were so careless back then... but now you're brave for the right reasons.")
                  src_text("Maya:I'm proud of you.");
                  break;
                  
                  //haru faces maya
                  case "scene 11 dialogue 4":
                           src_text("Haru:Maya...")
                           src_text("Airy:Alright, alright, heartwarming moment appreciated!");
                           break;
                          
                  
                  //airy goes on ahead in front of them haru and maya faces her
                  case "scene 11 dialogue 5":
                           src_text("Airy:But the Everbloom Tree is waiting, and we're SO close!");
                           break;
                  
                  
                  
                  //maya faces haru again
                  case "scene 11 dialogue 6":
                           src_text("Maya:She's right. This is it.");
                           src_text("Haru:Then let's finish this. Together.");
                           break;
                  
                  
                  //airy bounce haru and maya faces her again
                  case "scene 11 dialogue 7":
                           src_text("Airy:And with me too! Obviously!");
                           break;
                  
                  
                  
                  
                  
                  
                  
                  //final boss
                  
                  case "scene 12 dialogue 1":
                           src_text("Haru:We're here... Just beyond this path is the Everbloom tree");
                           src_text("Maya:Then after this, the curse, this is finally the end.");
                           break
                  
                  
                  
                  //Maya goes ahead but falls down
                  case "scene 12 dialogue 2":
                           src_text("Haru:Maya!");
                           src_text("Airy:The end?");
                           break;
                  
                  
                  //airy spawns
                  
                  case "scene 12 dialogue 3":
                          
                           src_text("Haru:What's the meaning of this, Airy?!");
                           src_text("Airy:You really believed I was guiding you?");
                           src_text("Airy:The insignia was never a key.The legend  I made it up.");
                           src_text("Airy:It's a prison for my Master. And you rebuilt of it for me.");     
                           break;
                  
                  //airy goes forward
                  case "scene 12 dialogue 4":
                           src_text("Airy:NOW...");
                           src_text("Airy:LET ALL CREATION TREMBLE AS YOU UNVEIL YOUR TRUE POWER!");
                           src_text("Airy:I OFFER YOU THE PERFECT VESSEL SHAPED BY FATE, CLAIMED BY DARKNESS!");
                           src_text("Airy:O CALAMITY INCARNATE...");
                           src_text("Airy:DEVOURER OF HORIZONS, BREAKER OF DAWN...");
                           src_text("Airy:MY ETERNAL SOVEREIGN NOCTYROS!");
                           src_text("Airy:ASCEND! SHATTER THIS WORLD AND REIGN AGAIN!");
                           break;
                  
                  
                  //wait 0.8
                  
                  case "scene 12 dialogue 5":
                           src_text("Noctyros:Free... at... last");
                           src_text("Maya:Haru RUN!");
                           break;
                  
                  
                  //camera shake fade out
                  case "scene 12 dialogue 6":
                           src_text("Airy:Do you feel it, Haru? This is not the first time.");
                           src_text("Airy:You two have walked this path for centuries reborn, chasing hope, dying the same way.");
                           src_text("Airy:Always failing. Always ending here.")
                           break;
                  
                  //wait 0.8
                  case "scene 12 dialogue 7":
                           src_text("Haru:You... used us");
                           src_text("Airy:Of course I did. You were born to serve this purpose.");
                           src_text("Airy:Come, Haru. Let this cycle end in darkness")
                           break;
                  
                  
                  
                  //wait 0.8
                  case "scene 12 dialogue 8":
                           src_text("Haru:No...");
                           src_text("Haru:This time, I'll break it");
                           break;
                           
                  
                  //after battle haru checks on maya
                  case "scene 12 dialogue 9":
                           src_text("Haru:Maya stay with me!");
                           src_text("Maya:I'm still here. Haru, don't worry");
                           break;
                  
                  
                  //maya stood up
                  case "scene 12 dialogue 10":
                           src_text("Haru:She got away... but it doesn't matter.");
                           src_text("Haru:We're almost there. We'll fix everything I swear it");
                           break;
                  
                  //haru and maya go to the tree
                  
                  
                  case "scene 12 dialogue 11":
                           src_text("Lightbearers... you have done well.");
                           src_text("Haru:What?! Who said that!?");
                           src_text("Maya:Haru... the tree... it's... talking...");
                           break;
                  
                  //wait 0.8
                  
                  case "scene 12 dialogue 12":
                           src_text("You have defeated the beast of calamity and broken the cycle.");
                           src_text("As both of you intended to do from the very beggining");
                           src_text("But to heal this world from its Wither... a sacrifice must be given.")
                           break;
                  
                  
                  //0.8 wait haru bounce
                  case "scene 12 dialogue 13":
                           src_text("Haru:Fine! Take me!");
                           break;
                  
                  
                  
                  //maya turns to haru
                  case "scene 12 dialogue 14":
                           src_text("Maya:No... Haru... you can't...");
                           src_text("Haru:Maya, please don't do this let me.");
                           src_text("Maya:...Forgive me, Haru.")
                           break;
                  
                  
                  
                  //maya casts a binding spell on haru
                  case "scene 12 dialogue 15":
                           src_text("Haru:I can't move...");
                           src_text("Maya:I know. If I don't stop you... you'll throw your life away.");
                           src_text("Maya:And I can't let that happen.")  
                           break;
                  

                  /// haru bound, maya steps toward the tree  
                  case "scene 12 dialogue 16":
                           src_text("Haru:Maya please!");
                           src_text("Maya:This world... it deserves to live. And you... you deserve to keep walking.");
                           break

                  
                  
                  /// maya's final words before sacrifice
                  case "scene 12 dialogue 17":
                           src_text("Maya:Thank you, Haru... for every step of this journey.");
                           src_text("Maya:Even if my path ends here... yours must continue.");
                           break;
                  
                  
                  /// everbloom responds as she offers herself
                  case "scene 12 dialogue 18":
                           src_text("Child of moonlight... your wish shall be honored.");
                           src_text("Let your soul become the dawn that heals this world.");
                           break;
                  
                  
                  
                  /// maya begins fading
                  case "scene 12 dialogue 19":
                           src_text("Haru:Maya...");
                           src_text("Maya:...Live, Haru. For both of us.");
                           break;
                  
                  /// petals scatter, healing begins
                  case "scene 12 dialogue 20":
                           src_text("Her sacrifice bathes the land in renewal.");
                           src_text("Rise, Lightbearer... and witness the world she saved.");
                           break;
                  
                  
                  
                  
                  /// final moment, haru alone
                  case "scene 12 dialogue 21":
                           src_text("Haru:...Goodbye, Maya.");
                           src_text("Haru:Your light... I'll carry it forever.");
                           break;
                  
                  
                  
                  
                  //-------------------------EPILOGUE---------------------------------------------------------------------------------------------------------------------//
                  
                  
                  
                  case "scene 13 dialogue 1":
                           src_text("Grandpa:You're here again, lad.");
                           src_text("Haru:...It feels like she's still with me when I'm by this tree.");
                           src_text("Grandpa:Aye. She left more than memories behind.");
                           break;
                  
                  
                  case "scene 13 dialogue 2":
                           src_text("Haru:Her absence hits me harder than I admit.");
                           src_text("Haru:More than I know how to say");
                           src_text("Haru:I hope she knew that.");
                           break;
                  
                  
                  
                  case "scene 13 dialogue 3":
                           src_text("Grandpa:She did.");
                           src_text("And this tree... it's her way of reminding you to keep going.")
                           src_text("Haru:...Yeah.");
                           src_text("Grandpa:That's all she'd want.")
                           break




                  
                  //grandpa walks off the fraame
                  case "scene 13 dialogue 4":
                           src_text("Grandpa:Come now, lad. Supper won't cook itself.")
                           break;


     
    }
         
         
         
         
         
         
    

}
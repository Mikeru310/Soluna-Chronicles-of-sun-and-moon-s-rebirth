
//saves the game
function SaveGame(_filename){

         var _save_data = {};
         
         //save party
         
         _save_data.party = [];
         
         for (var i = 0; i < array_length(global.party); i++) {
                  var p = global.party[i];
                  
                  array_push(_save_data.party, {
                           
                   name: p.name,
                   hp: p.hp,
                   hpmax: p.hpmax,
                   mpmax: p.mpmax,
                   strength : p.strength,
                           //save sprite names as strings
                   sprites: {
                           idle: sprite_get_name(p.sprites.idle),
                           attack: sprite_get_name(p.sprites.attack),
                           defend: sprite_get_name(p.sprites.defend),
                           cast: sprite_get_name(p.sprites.cast),
                           down: sprite_get_name(p.sprites.down)
                           
                           
                           },                                
                           actions: array_map(p.actions, function(a) { return a.name;})
                  
                  });
         }
         
       
         _save_data.inventory = [];
         for (var i = 0; i < array_length(global.inventory); i++) {
        var item = global.inventory[i];
        array_push(_save_data.inventory, {
            action: item[0].name,
            amount: item[1]
        });
    }
         
         //save current room
         
         _save_data.room = room_get_name(room);
         
         //save current position
         _save_data.player_x = obj_player.x;
         _save_data.player_y = obj_player.y;
         
         
         
         //Convert file and save
         var json = json_stringify(_save_data);
         var file = file_text_open_write(_filename);
         file_text_write_string(file, json);
         file_text_close(file);
         
         
         
         
}

//load game
function LoadGame(_filename) {
if (!file_exists(_filename)) return false;

var file = file_text_open_read(_filename);
var json = file_text_read_string(file);
file_text_close(file);
var _save_data = json_parse(json);

// load party
global.party = [];

for (var i = 0; i < array_length(_save_data.party); i++) {
var p = _save_data.party[i];
var actions = [];

for (var j = 0; j < array_length(p.actions); j++) {
         var action_name = p.actions[j];
         array_push(actions, global.actionLibrary[? action_name]);
}

array_push(global.party, {
         name: p.name,
         hp: p.hp,
         hpmax: p.hpmax,
         mp: p.mp,
         mpmax: p.mpmax,
         strength: p.strength,
         sprites: {
         idle: asset_get_index(p.sprites.idle),
         attack: asset_get_index(p.sprites.attack),
         defend: asset_get_index(p.sprites.defend),
         cast: asset_get_index(p.sprites.cast),
         down: asset_get_index(p.sprites.down)
         },
         actions: actions
});
}

// load inventory
global.inventory = [];
for (var i = 0; i < array_length(_save_data.inventory); i++) {
var item = _save_data.inventory[i];
array_push(global.inventory, [global.actionLibrary[? item.action], item.amount]);
}

// load room and player position
global.saved_room = asset_get_index(_save_data.room);
global.saved_player_x = _save_data.player_x;
global.saved_player_y = _save_data.player_y;

return true;
}







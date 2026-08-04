function ds_map_to_struct(_map) {
    // If the passed map is invalid, return an empty struct
    if (!ds_exists(_map, ds_type_map)) {
        return {};
    }

    var _struct = {};
    var keys = ds_map_keys(_map);

    for (var i = 0; i < array_length(keys); i++) {
        var key = keys[i];
        _struct[$ key] = _map[? key];
    }

    return _struct;
}


function struct_to_ds_map(_struct) {
    var _map = ds_map_create();

    // If struct is missing, return an empty ds_map
    if (_struct == undefined) {
        return _map;
    }

    var names = variable_struct_get_names(_struct);

    for (var i = 0; i < array_length(names); i++) {
        var key = names[i];
        ds_map_add(_map, key, _struct[$ key]);
    }

    return _map;
}


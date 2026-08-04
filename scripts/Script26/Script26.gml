function Tilemap_CollisionCheck(_tilemap, _x, _y) {
    var tilew = tilemap_get_tile_width(_tilemap);
    var tileh = tilemap_get_tile_height(_tilemap);

    var tile_x = floor(_x / tilew);
    var tile_y = floor(_y / tileh);

    var tiledata = tilemap_get(_tilemap, tile_x, tile_y);

    return (tiledata != 0); // true if solid
}


function Tilemap_Collides(_tilemap, _left, _top, _right, _bottom) {
    var tilew = tilemap_get_tile_width(_tilemap);
    var tileh = tilemap_get_tile_height(_tilemap);

    var start_x = floor(_left / tilew);
    var start_y = floor(_top / tileh);
    var end_x   = floor(_right / tilew);
    var end_y   = floor(_bottom / tileh);

    for (var tx = start_x; tx <= end_x; tx++) {
        for (var ty = start_y; ty <= end_y; ty++) {
            var tiledata = tilemap_get(_tilemap, tx, ty);
            if (tiledata != 0) return true; // solid tile found
        }
    }

    return false; // no collision
}

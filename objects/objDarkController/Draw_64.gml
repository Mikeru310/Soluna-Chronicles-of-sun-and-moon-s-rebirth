/// oDarkController - Draw GUI (fixed)
var gw = display_get_gui_width();
var gh = display_get_gui_height();

// Create/resize surface if needed
if (!surface_exists(dark_surf) || surface_get_width(dark_surf) != gw || surface_get_height(dark_surf) != gh) {
    if (surface_exists(dark_surf)) surface_free(dark_surf);
    dark_surf = surface_create(gw, gh);
}

surface_set_target(dark_surf);
draw_clear_alpha(c_black, 1); // full darkness

// get camera (assumes view 0 is used)
var cam = view_camera[0];

// Find the player instance (safe)
var pl = instance_find(obj_player, 0);
if (pl != noone) {
    // world -> GUI coords
    var px = pl.x - camera_get_view_x(cam);
    var py = pl.y - camera_get_view_y(cam);

    // safe radius fallback: use instance var if it exists otherwise default
    var pr = default_light_radius; // ensure you set this in Create of oDarkController
    if (variable_instance_exists(pl, "light_radius")) {
        pr = pl.light_radius;
    }

    // ensure numeric and positive
    pr = max(1, real(pr));

    // use destination-out blend to punch hole (GMS2+)
    gpu_set_blendmode_ext(bm_zero, bm_inv_src_alpha);

    // NOTE: last param 'false' => filled circle. true => outline only.
    draw_circle(px, py, pr, false);

    gpu_set_blendmode(bm_normal);
}

// Cut out placed lights (make sure oLight has light_radius & light_alpha defined in its Create)
with (objLight) {
    if (light_alpha > 0) {
        var lx = x - camera_get_view_x(cam);
        var ly = y - camera_get_view_y(cam);
        var lr = light_radius; // fixed radius

        gpu_set_blendmode_ext(bm_zero, bm_inv_src_alpha);

        // fade the circle by alpha
        draw_set_alpha(light_alpha);
        draw_circle(lx, ly, lr, false);
        draw_set_alpha(1);

        gpu_set_blendmode(bm_normal);
    }
}

surface_reset_target();
draw_surface(dark_surf, 0, 0);

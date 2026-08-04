// Start setup
target_x = x; // Final center position
x = x - 400; // Start from left
y_start = y;
y_bounce = -40; // How high it jumps
bounce_speed = 0.04; // Adjust speed (lower = slower)
bounce_timer = 0;
arrived = false;

// Scale (smaller, back to your preferred size)
scale_logo = 0.65; // <== adjust this value if still big (try 0.6 or 0.7)

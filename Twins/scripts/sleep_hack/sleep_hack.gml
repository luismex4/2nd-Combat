/// _sleep(ms)
var m = argument0;
var t = m * global.sleepScale * 50 / (50 + global.sleepAcc);
global.sleepAcc += m;
if (t < 1) return 0;
t += current_time;
while (current_time < t) { };